class Api::V1::ContactMethodsController < Api::BaseController
  before_action :authenticate_api_v1_user!
  before_action :set_contact_method, only: %i[show update destroy]

  # ------------------------------
  # GET /contact_methods
  # ------------------------------

  def index
    begin
      if params[:contact_id]
        @contact_methods = ContactMethod.includes(:contact).where('contact_id = ?', params[:contact_id])
        render json: ContactMethodSerializer.new(@contact_methods).serializable_hash.to_json
      else
        json_response({success: false, message: 'Contact Id needed to get contact methods '}, :unprocessable_entity)
      end
    rescue ActiveRecord::StatementInvalid => e
      json_response({success: false, message: 'Invalid Contact Id'}, :unprocessable_entity)
    end
  end


  # ------------------------------
  # GET /contact_methods/:id
  # ------------------------------

  def show
    render json: ContactMethodSerializer.new(@contact_method).serializable_hash
  end


  # ------------------------------
  # CREATE /contact_methods
  # ------------------------------

  def create
    # TODO cover all possible errors and create a descriptive feedback.

    # find the contact information
    get_contact_creator_id = Contact.find_by(id: contact_method_params[:contact_id])

    # extract the user_id from the content of the contact information variable get_contact_creator_id
    contact_user_id = get_contact_creator_id.user_id
               
    # FIXME no idea if this is working or not... or even if makes sense..
    # return  json_response({success: false, message: 'No contacts found with given contact_id'}, :unprocessable_entity), :bad_request if get_contact_creator_id.nil?

    # the contact owner (contact.user_id) is the same user as the
    # user logged in and performing the action of creating the contact method?
    # or has the logged in user admin or contributor role??
    if contact_user_id == @user.id || @user.admin? || @user.contributor?
      @contact_method = ContactMethod.new(contact_method_params)

      if @contact_method.save
        render json: ContactMethodSerializer.new(@contact_method).serializable_hash.to_json
      else
        json_response({success: false, message: @contact_method.errors}, :unprocessable_entity)

      end

    else
      json_response({success: false, message: 'You can not add a contact method in a contact you did not create and neither are you an admin or a contributor'}, :unprocessable_entity)
    end
  end


  # ------------------------------
  # PATCH/PUT /contact_methods/:id
  # ------------------------------

  def update
    if @contact_method.user_id == @user.id || @user.admin? || @user.contributor?
      if @contact_method.update(contact_method_params)
        render json: ContactMethodSerializer.new(@contact_method).serializable_hash
      else
        json_response({success: false, message: @contact_method.errors}, :unprocessable_entity)
      end
    else
      json_response({success: false, message: 'You can not update a contact method you did not create and neither are you an admin or a contributor'}, :unprocessable_entity)

    end
  end


  # ------------------------------
  # DELETE /contact_methods/:id
  # ------------------------------
  
  def destroy
    if @contact_method.user_id == @user.id || @user.admin? || @user.contributor?
      if @contact_method.destroy
        json_response({success: true, message: 'Contact method successfully deleted'})
      else
        json_response({success: false, message: @contact_method.errors}, :unprocessable_entity)
      end
    else
      json_response({success: false, message: 'You can not delete a contact method you did not create and neither are you an admin or a contributor'}, :unprocessable_entity)
    end
  end


  # ------------------------------
  # PRIVATE
  # ------------------------------

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_contact_method
    @contact_method = ContactMethod.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def contact_method_params
    merged_params = {updated_by: @user.id}
    merged_params = {created_by: @user.id} if params[:action] == 'create'
    merged_params = {user_id: @user.id} if params[:action] == 'create'
    params.require(:contact_method).permit(:contact_id, :user_id, :created_by, :updated_by, :kind, :visibility, :data,
                                           :notes).merge(merged_params)
  end
end
