class Api::V1::AccountsController < Api::BaseController
  before_action :authenticate_api_v1_user!
  before_action :admin_or_contributor!
  before_action :set_account, only: %i[show update destroy]

  def index
    @accounts = Account.includes(:platform, :contact).all
    render json: AccountSerializer.new(@accounts).serializable_hash
  end


  def show
    render json: AccountSerializer.new(@account).serializable_hash
  end

  

  def create
    @find_account = Account.find_by(contact_id: account_params[:contact_id])
    if @find_account.nil?
      @account = Account.new
      @account.platform_id = account_params[:platform_id]
      @account.category = account_params[:category]
      @account.contact_id = account_params[:contact_id]
      @account.country_id = account_params[:country_id]
      @account.currency_id = account_params[:currency_id]

      if @account.save
        render json: AccountSerializer.new(@account).serializable_hash
      else
        render json: @account.errors, status: :unprocessable_entity
      end
    else
      @find_account.errors.add(:show, message: 'Account under the above contact already exist!')
      render json: @find_account.errors, status: :unprocessable_entity
    end
  end

  def update
    if @account.update!(account_update_params)
      render json: AccountSerializer.new(@account).serializable_hash
    else
      render json: @account.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if @account.destroy
      json_response({ status: true, messages: 'The account was deleted' })
    else
      json_response({ status: false, messages: 'Something went wrong while deleting the account, try again!' })
    end
  end

  private

  def set_account
    @account = Account.find(params[:id])
  end

  def account_params
    params.require(:account).permit(:platform_id, :contact_id, :category, currency_id: [], country_id: [])
  end

  def account_update_params
    params.require(:account).permit(:platform_id, :contact_id, :category)
  end
end
