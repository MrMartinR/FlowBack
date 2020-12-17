class Api::V1::AccountsController < Api::BaseController
  before_action :authenticate_api_v1_user!
  before_action :admin_or_contributor!
  before_action :set_account, only: %i[show update destroy]

  #   This will get all the accounts data as well as corresponding relationship
  #
  def index
    @entities = []
    @check_tabel_count = Account.first
    if @check_tabel_count.nil?
      json_response({ "accounts": 'Accounts are empty, no records exist' })
    else
      Account.find_each do |account|
        dt = Hash.new(0)
        dt[:id] = account.id
        dt[:contact] = account.contact
        dt[:category] = account.category
        dt[:platform] = account.platform
        all_countries = []
        account.country_id.each do |id|
          all_countries << Country.find(id)
        end
        dt[:country] = all_countries
        all_currencies = []

        account.currency_id.each do |id|
          all_currencies << Currency.find(id)
        end
        dt[:currency] = all_currencies
        @entities << dt
      end
      json_response({ "accounts": @entities })
    end
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
      @account.country_id=account_params[:country_id]
      @account.currency_id=account_params[:currency_id]

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
=begin
The update the can take a  number of forms in our
case in the case of countries and currecies
  1. we can add a currency or a country, a push to the current array
  2. we could be removing a currency or a country
if i use update, and currency_id has one array, it will delete the existing one and replace it with out one entry which may not be the case. 
  my approach:
  am going to isolate the two
  the below update will only update 
  :platform_id, :contact_id, :category,
  we will formulate two addational controllers that will only perform an update and destroy for country and currency
=end

  def update
    if @account.update!(account_update_params)
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
    params.require(:account).permit(:platform_id, :contact_id, :category, currency_id: [], country_id: [])
  end
  def account_update_params
    params.require(:account).permit(:platform_id, :contact_id, :category)
  end
end
