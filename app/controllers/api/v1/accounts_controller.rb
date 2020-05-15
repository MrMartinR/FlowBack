class Api::V1::AccountsController < Api::BaseController
  before_action :authenticate_api_v1_user!
  before_action :admin_or_contributor! , except: [:index, :show]
  before_action :set_account, only: [:show, :update, :destroy]

  def index
    if params[:page].blank?
      @accounts = Account.includes(:currency, :country).order('accounts.name asc')
    else
      @accounts = Account.includes(:currency, :country).order('accounts.name asc').paginate(page: params[:page],per_page: params[:per_page])
      @total_pages = Account.includes(:currency, :country).order('accounts.name asc').paginate(page: params[:page],per_page: params[:per_page]).total_pages
    end
  end

  def show
  end

  def create
    @account = Account.new(account_params)

    if @account.save
      render :show, status: :created, location: @account
    else
      render json: @account.errors, status: :unprocessable_entity
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
      params.require(:account).permit(:currency_id, :country_id, :category, :name, :icon, :platform_id)
    end
end
