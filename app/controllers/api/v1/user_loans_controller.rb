class Api::V1::UserLoansController < Api::BaseController
  before_action :authenticate_api_v1_user!
  before_action :auth_admin!, only: :index_as_admin
  before_action :set_user_loan, only: %i[show update destroy]

  def index
    @user_loans = []
    UserLoan.all.where('user_id = ?', @user.id).limit(20).each do |user_loan|
      dt = data_return(user_loan)
      @user_loans << dt
    end
    json_response({ success: true, message: @user_loans })
    # @user_loans = UserLoan.all.where('user_id = ?', @user.id).limit(20)
  end

  def show_user_loan_by_loan_id
    @user_loan = UserLoan.where('loan_id = ?', params[:loan_id])
    json_response({ success: true, message: @user_loan})
  end

  def show; end

  def create
    @user_loan = @user.user_loans.new(user_loan_params)

    if @user_loan.save
      render :show, status: :created
    else
      json_response({ success: false, message: @user_loan.errors }, :unprocessable_entity)
    end
  end

  def update
    if @user_loan.update(user_loan_params)
      render :show, status: :ok
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
    @user_loan = UserLoan.find(params[:id])
    # @user_loan = @user.user_loans.find(params[:id])
  end

  def user_loan_params
    merge_params = { user_id: @user.id }
    params.require(:user_loan).permit(:loan_id, :user_account_id, :slice_name, :market, :xirr, :investment_amount,
                                      :invest_mode, :position, :date_in, :date_out).merge(merge_params)
  end

  def data_return(user_loan)
    dt = Hash.new(0)
    dt[:id] = user_loan.id
    dt[:loan_id] = user_loan.loan_id
    dt[:user_account] = user_loan.user_account
    dt[:slice_name] = user_loan.slice_name
    dt[:market] = user_loan.market
    dt[:xirr] = user_loan.xirr
    dt[:investment_amount] = user_loan.investment_amount
    dt[:invest_mode] = user_loan.invest_mode
    dt[:position] = user_loan.position
    dt[:date_in] = user_loan.date_in
    dt[:date_out] = user_loan.date_out
    
    dt[:loan_name] = user_loan.loan.name
    dt[:loan_status] = user_loan.loan.status
    dt[:loan_rating] = user_loan.loan.rating
    dt[:loan_borrower_type] = user_loan.loan.borrower_type
    dt[:loan_category] = user_loan.loan.category
    dt[:loan_amount] = user_loan.loan.amount
    dt[:loan_borrower] = user_loan.loan.borrower
    dt[:loan_date_listed] = user_loan.loan.date_listed
    dt[:loan_date_issued] = user_loan.loan.date_issued
    dt[:loan_date_maturity] = user_loan.loan.date_maturity
    dt[:loan_amortization] = user_loan.loan.amortization 
    dt[:loan_installment] = user_loan.loan.installment 

    dt
  end

end
