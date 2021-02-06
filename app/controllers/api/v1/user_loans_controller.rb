class Api::V1::UserLoansController < Api::BaseController
  before_action :authenticate_api_v1_user!
  before_action :auth_admin!, only: :index_as_admin
  before_action :set_user_loan, only: %i[show update destroy]

  def index
    @user_loans = UserLoan.by_user(@user).order('created_at desc')
    render json: UserLoanSerializer.new(@user_loans).serializable_hash
  end

  def show; end

  def create
    @user_loan = @user.user_loans.new(user_loan_params)

    if @user_loan.save
      render json: UserLoanSerializer.new(@user_loan).serializable_hash
    else
      json_response({ success: false, message: @user_loan.errors }, :unprocessable_entity)
    end
  end

  def update
    if @user_loan.update(user_loan_params)
      render json: UserLoanSerializer.new(@user_loan).serializable_hash
    else
      json_response({ success: false, message: @user_loan.errors }, :unprocessable_entity)
    end
  end

  def destroy
    if @user_loan.destroy
      json_response({ success: true, message: 'User loan deleted' })
    else
      json_response({ success: false, message: @user_loan.errors }, :unprocessable_entity)
    end
  end

  private

  def set_user_loan
    @user_loan = @user.user_loans.find(params[:id])
  end

  def user_loan_params
    merge_params = { user_id: @user.id }
    params.require(:user_loan).permit(:loan_id, :user_account_id, :slice_name, :market, :xirr, :investment_amount,
                                      :invest_mode, :position, :date_in, :date_out).merge(merge_params)
  end
end
