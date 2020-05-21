class Api::V1::UserLoansController < Api::BaseController
  before_action :authenticate_api_v1_user!
  before_action :auth_admin!, only: :index_as_admin
  before_action :set_user_loan, only: [:show, :update, :destroy]

  def index
    if params[:page].blank?
      @user_loans = UserLoan.by_user(@user).order('created_at desc')
    else
      @user_loans = UserLoan.by_user(@user).order('created_at desc').paginate(page: params[:page], per_page: params[:per_page])
      @total_pages = UserLoan.by_user(@user).order('created_at desc').paginate(page: params[:page], per_page: params[:per_page]).total_pages
    end
  end

  def search
    @search = UserLoan.by_user(@user).ransack(params[:q])
    @user_loans = @search.result(distinct: true).paginate(page: params[:page], per_page: params[:per_page])
    @total_pages = @search.result(distinct: true).paginate(page: params[:page], per_page: params[:per_page]).total_pages
    @search.build_condition

    render :index
  end

  def show
  end

  def index_as_admin
    if params[:page].blank?
      @user_loans = UserLoan.order('created_at desc')
    else
      @user_loans = UserLoan.order('created_at desc').paginate(page: params[:page], per_page: params[:per_page])
      @total_pages = UserLoan.order('created_at desc').paginate(page: params[:page], per_page: params[:per_page]).total_pages
    end

    render :index
  end

  def create
    @user_loan = @user.user_loans.new(user_loan_params)

    if @user_loan.save
      render :show, status: :created
    else
      json_response({success:false, :message => @user_loan.errors},:unprocessable_entity)
    end
  end

  def update
    if @user_loan.update(user_loan_params)
      render :show, status: :ok
    else
      json_response({success:false, :message => @user_loan.errors},:unprocessable_entity)
    end
  end

  def destroy
    @user_loan.destroy
  end

  private
    def set_user_loan
      @user_loan = @user.user_loans.find(params[:id])
    end

    def user_loan_params
      params.require(:user_loan).permit(:country_id, :loan_id, :currency_id, :originator_id, :user_account_id, :platform_id, :slice_name, :market, :xirr, :investment_amount, :invest_mode, :position, :date_in, :date_out, :principal_remaining, :interest, :bonus, :tax, :loss, :fee, :contract_url)
    end
end
