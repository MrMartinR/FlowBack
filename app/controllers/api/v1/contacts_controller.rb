class Api::V1::ContactsController < Api::BaseController
  before_action :authenticate_api_v1_user!
  before_action :set_contact, only: %i[show update destroy]

  # GET /contacts
  # GET /contacts.json

  # Get a list of public contacts and the private contacts
  # from the logged user in ASC order.
  # contacts = Contact.select(Arel.sql("*, coalesce(trade_name, nick, name) as name_header")).order(Arel.sql("coalesce(trade_name, nick, name) ASC")).where("user_id = ? or visibility = ?", @user.id, "Public")
  # render json:ContactSerializer.new(contacts, {fields: { contact: [:name, ] }}).serializable_hash
  def index
  @contacts = Contact.select(Arel.sql("*, coalesce(trade_name, nick, name) as name_header")).order("name_header ASC").where("user_id = ? or visibility = ?", @user.id, "Public")
  render json:ContactSerializer.new(@contacts, {fields: { contact: [:name_header, ] }}).serializable_hash.to_json
  end


  # GET /contacts/:id
  # GET /contacts/:id.json
  def show
    render json: ContactSerializer.new(@contact).serializable_hash.to_json
  end

  # POST /contacts
  # POST /contacts.json
  def create
    if contact_params[:visibility] == 'Public'
      if @user.admin? || @user.contributor?
        @contact = Contact.new(contact_params)
        @contact.user_id = nil
        if @contact.save
          render json: ContactSerializer.new(@contact).serializable_hash
        else
          json_response({ success: false, message: @contact.errors }, :unprocessable_entity)
        end
      else
        json_response({ success: false, message: 'Only admin or contributor can create a public contact' },
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

  # PATCH/PUT /contacts/:id
  # PATCH/PUT /contacts/:id.json
  def update
    if @contact.visibility == 'Public'
      if @user.admin? || @user.contributor?
        if @contact.update(contact_params)
          render json: ContactSerializer.new(@contact).serializable_hash
        else
          json_response({ success: false, message: @contact.errors }, :unprocessable_entity)
        end
      else
        json_response({ success: false, message: 'Only admin or contributor can update a public contact' },
                      :unprocessable_entity)
      end
    elsif @contact.update(contact_params)
      render json: ContactSerializer.new(@contact).serializable_hash
    else
      json_response({ success: false, message: @contact.errors }, :unprocessable_entity)
    end
  end

  # DELETE /contacts/:id
  # DELETE /contacts/:id.json
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
                                    :name, :surname, :company_name,
                                    :trade_name, :nick, :founded,
                                    :description, :legal_form, :tags, :id_number, :dob)
      .merge(merged_params)
  end
end
