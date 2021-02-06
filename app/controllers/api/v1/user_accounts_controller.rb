class Api::V1::UserAccountsController < Api::BaseController
  before_action :authenticate_api_v1_user!
  before_action :set_user_account, only: %i[show update destroy]

  def index
    @user_accounts = @user.user_accounts.includes(:country, :account, :currency, :user, :user_loans).order('name asc')
    render json: UserAccountSerializer.new(@user_accounts).serializable_hash
  end

  def show; end

  def create
    @user_account = @user.user_accounts.new(user_account_params)

    if @user_account.save
      render json: UserAccountSerializer.new(@user_accounts).serializable_hash
    else
      json_response({ success: false, message: @user_account.errors }, :unprocessable_entity)
    end
  end

  def update
    if @user_account.update(user_account_params)
      render json: UserAccountSerializer.new(@user_accounts).serializable_hash
    else
      json_response({ success: false, message: @user_account.errors }, :unprocessable_entity)
    end
  end

  def destroy
    if @user_account.destroy
      json_response({ success: true, message: 'User account deleted' })
    else
      json_response({ success: false, message: @user_account.errors }, :unprocessable_entity)
    end
  end

  private

  def set_user_account
    @user_account = @user.user_accounts.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def user_account_params
    merged_params = { user_id: @user.id }
    params.require(:user_account).permit(:country_id, :account_id, :currency_id, :category, :name,
                                         :active).merge(merged_params)
  end
end
