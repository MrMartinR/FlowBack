class Api::V1::TransactionsController < Api::BaseController
  before_action :authenticate_api_v1_user!
  before_action :set_transaction, only: [:show, :update, :destroy]

  def index
    @transactions = Transaction.transactions_list(params)
  end

  def show
  end

  def create
    @transaction = Transaction.new(transaction_params)

    if @transaction.save
      render :show, status: :created
    else
      render json: @transaction.errors, status: :unprocessable_entity
    end
  end

  def update
    if @transaction.update(transaction_params)
      render :show, status: :ok
    else
      render json: @transaction.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @transaction.destroy
  end

  private
    def set_transaction
      @transaction = Transaction.find(params[:id])
    end

    def transaction_params
      params.require(:transaction).permit(:country_id, :user_account_id, :user_account_related_id, :currency_id, :user_id, :loan_id, :property_id, :kind, :ref, :date, :time, :category, :description, :amount, :notes, :shares, :share_price)
    end
end
