class Api::V1::AccountsController < Api::BaseController
  before_action :set_account, only: [:show, :update, :destroy]
  before_action :authenticate_api_v1_user!

  def index
    @accounts = Account.includes(:currency, :country).order('accounts.name asc')
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
    if @account.update(account_params)
      render :show, status: :ok, location: @account
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
      params.require(:account).permit(:currency_id, :country_id, :category, :name, :icon)
    end
end
