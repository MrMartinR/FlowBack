class Api::V1::LoansController < Api::BaseController
  before_action :authenticate_api_v1_user!
  before_action :admin_or_contributor!, except: [:index, :show]
  before_action :set_loan, only: [:show, :update, :destroy]

  def index
    @loans = Loan.includes(:country, :currency, :platform_originator).order('created_at desc')
  end

  def show
  end

  def create
    @loan = Loan.new(loan_params)

    if @loan.save
      render :show, status: :created
    else
      json_response({ success: false, :message => @loan.errors }, :unprocessable_entity)
    end
  end

  def update
    if @loan.update(loan_params)
      render :show, status: :ok
    else
      json_response({ success: false, :message => @loan.errors }, :unprocessable_entity)
    end
  end

  def destroy
    if @loan.destroy
      json_response({ success: true, message: 'Loan  deleted' })
    else
      json_response({ success: false, message: @loan.errors }, :unprocessable_entity)
    end
  end

  private

  def set_loan
    @loan = Loan.find(params[:id])
  end

  def loan_params
    merged_params = { updated_by: @user.id }
    merged_params = { created_by: @user.id } if params[:action] == "create"

    params.require(:loan).permit(:country_id, :currency_id, :platform_originator_id, :code, :internal_code, :name,
                                 :borrower, :gender, :air, :status, :xirr, :rating,
                                 :dti_rating, :borrower_type, :category, :amount,
                                 :description, :link, :security_details, :date_listed, :date_issued,
                                 :date_maturity, :amortization, :installment, :notes,
                                 protection_scheme: []).merge(merged_params)
  end
end
