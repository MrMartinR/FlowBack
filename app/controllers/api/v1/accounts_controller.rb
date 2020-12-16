class Api::V1::AccountsController < Api::BaseController
  before_action :authenticate_api_v1_user!
  before_action :admin_or_contributor!
  before_action :set_account, only: [:show, :update, :destroy]

=begin
  This will get all the accounts data as well as corresponding relationship
  
=end
  def index
    @entities = []
    Account.find_each do |account|
      dt = Hash.new(0)
      dt[:id] = account.id
      dt[:contact] = account.contact
      dt[:category] = account.category
      dt[:platform] = account.platform
      all_countries = []
      account.country_id[0].each do |id|
        all_countries << Country.find(id)
      end
      dt[:country] = all_countries
      all_currencies = []

      account.currency_id[0].each do |id|
        all_currencies << Currency.find(id)
      end
      dt[:currency] = all_currencies
      @entities << dt
    end
    json_response({ "accounts": @entities, pages: @total_pages, page: 1 })
  end

  #   The create allow an admin or a contributor to add an account
  #   An account can have more that one country and more than one currecy
  #   the counry and currecy comes in the form of arrays then added into the account
  #   column
  #   dublication is not an option so the use of arrays
  def create
    @find_account = Account.find_by(contact_id: account_params[:contact_id])
    if @find_account.nil?
      @account = Account.new
      @account.platform_id = account_params[:platform_id]
      @account.category = account_params[:category]
      @account.contact_id = account_params[:contact_id]
      @account.currency_id = []
      @account.country_id = []
      @account.country_id.push(account_params[:country_ids])
      @account.currency_id.push(account_params[:currency_ids])

      if @account.save
        render :show, status: :created, data: @account
      else
        render json: @account.errors, status: :unprocessable_entity
      end
    else
      @find_account.errors.add(:show, message: 'Account under the above contact already exist!')
      render json: @find_account.errors, status: :unprocessable_entity
    end
  end

  def update
    if @account.update!(account_params)
      render :show, status: :ok
    else
      render json: @account.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @account.destroy
  end

  private

  def set_account
    @account = Account.find(params[:id])
  end

  def account_params
    params.require(:account).permit(:platform_id, :contact_id, :category, currency_ids: [], country_ids: [])
  end
end
