class Api::V1::AccountsController < Api::BaseController
  before_action :authenticate_api_v1_user!
  before_action :admin_or_contributor!
  before_action :set_account, only: %i[show update destroy]

  def index
    @accounts = Account.find_by_sql("
      SELECT
      a.id,
      a.contact_id,
      c.trade_name
      from accounts a
      inner join contacts c on c.id = a.contact_id
      ORDER BY c.trade_name
      ")
  end

  def show; end

  # def index
  #   @entities = []
  #   @check_table_count = Account.first
  #   if @check_table_count.nil?
  #     json_response({ "accounts": 'Accounts are empty, no records exist' })
  #   else
  #     Account.find_each do |account|
  #       dt = Hash.new(0)
  #       dt[:id] = account.id
  #       dt[:contact] = account.contact
  #       # dt[:category] = account.category
  #       # dt[:platform] = account.platform
  #       # all_countries = []
  #       # account.country_id.each do |id|
  #       #   all_countries << Country.find(id) unless id.nil?
  #       # end
  #       # dt[:country] = all_countries
  #       # all_currencies = []

  #       # account.currency_id.each do |id|
  #       #   all_currencies << Currency.find(id) unless id.nil?
  #       # end
  #       # dt[:currency] = all_currencies
  #       # @entities << dt
  #     end
  #     json_response({ "accounts": @entities })
  #   end
  # end

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
    if @account.update!(account_update_params)
      render :show, status: :ok
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
