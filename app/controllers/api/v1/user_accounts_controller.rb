class Api::V1::UserAccountsController < Api::BaseController
  before_action :authenticate_api_v1_user!
  before_action :set_user_account, only: [:show, :update, :destroy]

  def index
    @user_accounts = @user.user_accounts.order('name asc').
        paginate(page: params[:page], per_page: params[:per_page])
  end

  def search
    @search = @user.user_accounts.includes(:country, :currency).ransack(params[:q])
    @user_accounts = @search.result(distinct: false).order('name asc').paginate(page: params[:page], per_page: params[:per_page])
    render :index
  end


  def show
  end

  def create
    @user_account = @user.user_accounts.new(user_account_params)

    if @user_account.save
      render :show, status: :created
    else
      json_response({success:false, :message => @user_account.errors},:unprocessable_entity)
    end
  end

  def update
    if @user_account.update(user_account_params)
      render :show, status: :ok
    else
      json_response({success:false, :message => @user_account.errors},:unprocessable_entity)
    end
  end

  def destroy
    @user_account.destroy
  end

  private
    def set_user_account
      @user_account = @user.user_accounts.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_account_params
      params.require(:user_account).permit(:country_id, :account_id, :currency_id, :user_id, :category, :name,  :active)
    end
end

