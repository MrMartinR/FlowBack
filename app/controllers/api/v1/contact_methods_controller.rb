class Api::V1::ContactMethodsController < Api::BaseController
  before_action :authenticate_api_v1_user!
  before_action :set_contact_method, only: %i[show update destroy]

  def index
    @contact_methods = ContactMethod.includes(:contact).where('contact_id = ?', contact_method_params[:contact_id])
  end

  def show; end

  def create
    get_contact_creator_id = Contact.find(contact_method_params[:contact_id]).created_by
    get_contact_creator = User.find(get_contact_creator_id)
    if get_contact_creator_id == @user.id || get_contact_creator.is_admin? || get_contact_creator.is_contributor?
      @contact_method = ContactMethod.new(contact_method_params)

      if @contact_method.save
        render :show, status: :created
      else
        json_response({ success: false, message: @contact_method.errors }, :unprocessable_entity)
      end

    else
      json_response({ success: false, message: 'You can not add a contact method in a contact you did not create and neither are you an admin or a contributor ' }, :unprocessable_entity)

    end
  end

  def update
    if @contact_method.created_by == @user.id || @user.is_admin? || @user.is_contributor?
      if @contact_method.update(contact_method_params)
        render :show, status: :ok
      else
        json_response({ success: false, message: @contact_method.errors }, :unprocessable_entity)
      end
    else
      json_response({ success: false, message: 'You can not update a contact method you did not create and neither are you an admin or a contributor ' }, :unprocessable_entity)

    end
  end

  def destroy
    if @contact_method.created_by == @user.id || @user.is_admin? || @user.is_contributor?
      if @contact_method.destroy
        json_response({ success: true, message: 'Contact method deleted' })
      else
        json_response({ success: false, message: @contact_method.errors }, :unprocessable_entity)
      end
    else
      json_response({ success: false, message: 'You can not delete a contact method you did not create and neither are you an admin or a contributor ' }, :unprocessable_entity)

    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_contact_method
    @contact_method = ContactMethod.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def contact_method_params
    merged_params = { updated_by: @user.id }
    merged_params = { created_by: @user.id } if params[:action] == 'create'
    params.require(:contact_method).permit(:contact_id, :created_by, :updated_by, :kind, :visibility, :data,
                                           :notes).merge(merged_params)
  end
end
