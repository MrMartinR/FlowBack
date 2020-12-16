class Api::V1::AccountsController < Api::BaseController
  before_action :authenticate_api_v1_user!
  before_action :admin_or_contributor!
  # before_action :set_account, only: [:show, :update, :destroy]

  def index
    if params[:page].blank?
      @entities = Account.select('accounts.id,  accounts.name, accounts.category, accounts.icon').order('accounts.name asc')
      res = json_response({ "entities": @entities, pages: @total_pages, page: 1 })
    else
      @entities = Account
                  .select('accounts.id,  accounts.name, accounts.category, accounts.icon, accounts.currency_id, accounts.country_id')
                  .order('accounts.name asc')
                  .paginate(page: params[:page], per_page: params[:per_page])

      @pages = Account.includes(:currency, :country).order('accounts.name asc').paginate(page: params[:page],
                                                                                         per_page: params[:per_page]).total_pages

      res = json_response({ "entities": @entities, pages: @pages, page: params[:page].to_i })
    end
    res
  end

  def show; end

=begin
  The create allow an admin or a contributor to add an account
  An account can have more that one country and more than one currecy
  the counry and currecy comes in the form of arrays then added into the account
  column
  dublication is not an option so the use of arrays
=end
  def create
    @find_account = Account.find_by(name: account_params[:name])
    if @find_account.nil?
      @account = Account.new
      @account.name = account_params[:name]
      @account.platform_id = account_params[:platform_id]
      @account.category = account_params[:category]
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
      @find_account.errors.add( :show, message: 'Account already exist!')
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
    params.require(:account).permit(:platform_id, :name, :category, currency_ids: [], country_ids: [])
  end
end