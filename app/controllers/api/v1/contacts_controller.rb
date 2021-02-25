class Api::V1::ContactsController < Api::BaseController
  before_action :authenticate_api_v1_user!
  before_action :set_contact, only: %i[show update destroy]

  # GET /contacts
  # GET /contacts.json

  # Get a list of public contacts and the private contacts
  # from the logged user in ASC order.
  def index
    @contacts = Contact.includes(:platform, :originator, :country, :account, :user, :contact_methods).all
    render json: ContactSerializer.new(@contacts).serializable_hash
  end

  # def index
  # @contacts = Contact.where(user_id: [nil, @user.id]).order(name: :asc, nick: :asc, trade_name: :asc)
  # end

  # GET /contacts/1
  # GET /contacts/1.json
  def show; end

  # POST /contacts
  # POST /contacts.json
  def create
    if contact_params[:visibility] == 'PUBLIC'
      if @user.admin? || @user.contributor?
        @contact = Contact.new(contact_params)
        @contact.user_id = nil
        if @contact.save
          render json: ContactSerializer.new(@contact).serializable_hash
        else
          json_response({ success: false, message: @contact.errors }, :unprocessable_entity)
        end
      else
        json_response({ success: false, message: 'Only admin or contrib can create a public contact' },
                      :unprocessable_entity)
      end
    else
      @contact = Contact.new(contact_params)
      @contact.user_id = @user.id
      if @contact.save
        render json: ContactSerializer.new(@contact).serializable_hash
      else
        json_response({ success: false, message: @contact.errors }, :unprocessable_entity)
      end
    end
  end

  # PATCH/PUT /contacts/1
  # PATCH/PUT /contacts/1.json
  def update
    if @contact.visibility == 'PUBLIC'
      if @user.admin? || @user.contributor?
        if @contact.update(contact_params)
          render json: ContactSerializer.new(@contact).serializable_hash
        else
          json_response({ success: false, message: @contact.errors }, :unprocessable_entity)
        end
      else
        json_response({ success: false, message: 'Only admin or contrib can update a public contact' },
                      :unprocessable_entity)
      end
    elsif @contact.update(contact_params)
      render json: ContactSerializer.new(@contact).serializable_hash
    else
      json_response({ success: false, message: @contact.errors }, :unprocessable_entity)
    end
  end

  # DELETE /contacts/1
  # DELETE /contacts/1.json
  def destroy
    if @contact.destroy
      json_response({ success: true, message: 'Contact deleted' })
    else
      json_response({ success: false, message: @contact.errors }, :unprocessable_entity)
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_contact
    @contact = Contact.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def contact_params
    merged_params = { updated_by: @user.id, user_id: @user.id }
    merged_params = { created_by: @user.id } if params[:action] == 'create'

    params.require(:contact).permit(:country_id, :user_id, :kind, :visibility,
                                    :name, :surname,
                                    :trade_name, :nick, :founded,
                                    :description, :legal_form, :tags, :id_number, :dob)
      .merge(merged_params)
  end
end
