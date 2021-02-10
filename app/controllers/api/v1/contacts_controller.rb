class Api::V1::ContactsController < Api::BaseController
  before_action :set_contact, only: %i[show update destroy]

  # GET /contacts
  # GET /contacts.json
  def index
    contacts = current_user.contacts.order(name: :asc, nick: :asc, trade_name: :asc)
    render json: ContactsSerializer.new(contacts),
           status: :ok
  end

  # GET /contacts/1
  # GET /contacts/1.json
  def show; end

  # POST /contacts
  # POST /contacts.json
  def create
    if contact_params[:visibility] == 'PUBLIC'
      if current_user.admin? || current_user.contributor?
        contact = Contact.new(contact_params)
        contact.user_id = nil

        if contact.save
          render json: ContactsSerializer.new(contact),
                 status: :created, location: api_v1_contact_path(contact)
        else
          render json: ErrorSerializer.new(contact).serialize,
                 status: :unprocessable_entity
        end

      else
        render json: { errors: [{ detail: 'Only admin or contributer can create a public contact' }] },
               status: :forbidden

      end
    else
      contact = current_user.contacts.new(contact_params)
      if contact.save
        render json: ContactsSerializer.new(contact),
               status: :created, location: api_v1_contact_path(contact)
      else
        render json: ErrorSerializer.new(contact).serialize,
               status: :unprocessable_entity
      end
    end
  end

  # PATCH/PUT /contacts/1
  # PATCH/PUT /contacts/1.json
  def update
    if @contact.visibility == 'PUBLIC'
      if current_user.admin? || current_user.contributor?
        if @contact.update(contact_params)
          render json: ContactsSerializer.new(@contact),
                 status: :ok
        else
          render json: ErrorSerializer.new(@contact).serialize,
                 status: :unprocessable_entity
        end
      else
        render json: { errors: [{ detail: 'Only admin or contributer can update a public contact' }] },
               status: :forbidden
      end

    elsif @contact.update(contact_params)
      render json: ContactsSerializer.new(@contact),
             status: :ok
    else
      render json: ErrorSerializer.new(@contact).serialize,
             status: :unprocessable_entity
    end
  end

  # DELETE /contacts/1
  # DELETE /contacts/1.json
  def destroy
    if @contact.destroy
      render json: { meta: { message: 'Contact successfully deleted' } },
             status: :ok
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
    merged_params = { updated_by: current_user.id, user_id: current_user.id }
    merged_params = { created_by: current_user.id } if params[:action] == 'create'

    params
      .require(:data)
      .require(:attributes)
      .permit(:id, :country_id, :user_id, :kind, :visibility,
              :company_name, :name, :surname, :trade_name, :nick,
              :founded, :description, :legal_form, :tags, :id_number, :dob)
      .merge(merged_params)
  end
end
