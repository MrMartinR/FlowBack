class Api::V1::LoansController < Api::BaseController
  before_action :authenticate_api_v1_user!
  before_action :admin_or_contributor!, except: %i[index show]
  before_action :set_loan, only: %i[show update destroy]
  before_action :set_platform, only: :index_by_platform_originator

  def index
    @loans = Loan.includes(:country, :currency, :user_loans, platform_originator: [platform: [:contact], originator: [:contact]]).order('created_at desc')
    render json: LoanSerializer.new(@loans, { fields: { loan: [:code, :internal_code, :name, :borrower, :gender, :air,
                                                               :status, :xirr, :protection_scheme, :rating, :dti_rating, :borrower_type,
                                                               :category, :amount, :description, :link, :security_details, :amortization,
                                                               :date_maturity, :date_listed, :date_issued, :installment, :notes, :country,
                                                               :currency, :originator, :platform, :platform_trade_name, :originator_trade_name]}}).serializable_hash
  end

  def index_by_platform_originator
    platform = Platform.find_by(id: @platform.id)
    @loans = Loan.includes(:country, :currency, :user_loans, platform_originator: [platform: [:contact], originator: [:contact]]).all.where(platform_originator_id: platform.platform_originators.ids)
    render json: LoanSerializer.new(@loans, { fields: { loan: [:platform_contact_id, :originator_contact_id, :country_iso_code, :country_name, :platform_trade_name, :currency_code, :country_id, :currency_id,
                                                               :code, :internal_code, :name, :borrower, :gender, :air, :status, :xirr, :protection_scheme, :rating,
                                                               :dti_rating, :borrower_type, :category, :amount, :description, :link, :security_details, :amortization,
                                                               :date_maturity, :date_listed, :date_issued, :installment, :notes, :originator_trade_name, :created_at,
                                                               :updated_at, :created_by, :updated_by] } }).serializable_hash
  end

  def show
    render json: LoanSerializer.new(@loan).serializable_hash
  end

  def create
    @loan = Loan.new(loan_params)

    if @loan.save
      render json: LoanSerializer.new(@loan).serializable_hash
    else
      json_response({ success: false, message: @loan.errors }, :unprocessable_entity)
    end
  end

  def update
    if @loan.update(loan_params)
      render json: LoanSerializer.new(@loan).serializable_hash
    else
      json_response({ success: false, message: @loan.errors }, :unprocessable_entity)
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

  def set_platform
    @platform = Platform.find(params[:id])
  end

  def set_loan
    @loan = Loan.find(params[:id])
  end

  def loan_params
    merged_params = { updated_by: @user.id }
    merged_params = { created_by: @user.id } if params[:action] == 'create'

    params.require(:loan).permit(:country_id, :currency_id, :platform_originator_id, :code, :internal_code, :name,
                                 :borrower, :gender, :air, :status, :xirr, :rating,
                                 :dti_rating, :borrower_type, :category, :amount,
                                 :description, :link, :security_details, :date_listed, :date_issued,
                                 :date_maturity, :amortization, :installment, :notes,
                                 protection_scheme: []).merge(merged_params)
  end
end
