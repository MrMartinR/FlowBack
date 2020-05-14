class Api::V1::UserAccountsController < Api::BaseController
  before_action :authenticate_api_v1_user!
  before_action :set_user_account, only: [:show, :update, :destroy]

  def index
    @user_accounts = UserAccount.order('name asc').paginate(page: params[:page])
  end

  def show
  end

  def create
    @user_account = UserAccount.new(user_account_params)

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
      @user_account = UserAccount.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_account_params
      params.require(:user_account).permit(:country_id, :account_id, :platform_id, :currency_id, :user_id, :category, :name, :total_fee, :total_loss, :total_tax, :active, :total_invest, :total_profit, :total_referral, :total_interest, :total_bonus)
    end
end
