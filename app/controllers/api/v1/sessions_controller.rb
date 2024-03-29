class Api::V1::SessionsController < DeviseTokenAuth::SessionsController
  def create
    # Check
    field = (resource_params.keys.map(&:to_sym) & resource_class.authentication_keys).first

    @resource = nil
    if field
      q_value = get_case_insensitive_field_from_resource_params(field)

      @resource = find_resource(field, q_value)
    end

    if @resource && valid_params?(field, q_value) && (!@resource.respond_to?(:active_for_authentication?) || @resource.active_for_authentication?)
      valid_password = @resource.valid_password?(resource_params[:password])
      return render_create_error_bad_credentials if (@resource.respond_to?(:valid_for_authentication?) && !@resource.valid_for_authentication? { valid_password }) || !valid_password

      @token = @resource.create_token
      @resource.save!

      sign_in(:user, @resource, store: false, bypass: false)

      yield @resource if block_given?

      render_create_success
    elsif @resource && !(!@resource.respond_to?(:active_for_authentication?) || @resource.active_for_authentication?)
      if @resource.respond_to?(:locked_at) && @resource.locked_at
        render_create_error_account_locked
      else
        render_create_error_not_confirmed
      end
    else
      render_create_error_bad_credentials
    end
  end

  def render_create_success
    render json: {
      success: true,
      role: @resource.roles.try(:first).try(:name),
      data: @resource,
      token: @token
    }, status: 200
  end

  private

  def sign_in_params
    params.require(:user).permit(:email, :password)
  end

  def resource_params
    params.require(:user).permit(*params_for_resource(:sign_in))
  end

 # Implements the case insensitive in the login process
  def find_resource(field, value)
    @resource = resource_class.find_by("LOWER(#{field}) = ? AND provider = ?", value.downcase, provider)
  end
end
