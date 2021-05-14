class Api::V1::TransactionsController < Api::BaseController
  before_action :authenticate_api_v1_user!
  before_action :set_transaction, only: %i[show update destroy]
  before_action :set_user_account, only: :index_by_user_account

  def index
    @transactions =  Transaction.includes(:loan, :user_account).all.order('created_at desc')
    render json: TransactionSerializer.new(@transactions).serializable_hash
  end

  def index_by_user_account
    @transactions = Transaction.includes(:user_account, :loan).all.where('user_account_id = ?', @user_account.id).order('created_at desc')
    render json: TransactionSerializer.new(@transactions).serializable_hash
  end

  def show
    render json: TransactionSerializer.new(@transaction).serializable_hash
  end

  def create
    @transaction = Transaction.new(transaction_params)

    if @transaction.save
      render json: TransactionSerializer.new(@transaction).serializable_hash
    else
      render json: @transaction.errors, status: :unprocessable_entity
    end
  end

  def update
    if @transaction.update(transaction_params)
      render json: TransactionSerializer.new(@transaction).serializable_hash
    else
      render json: @transaction.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if @transaction.destroy
      json_response({ success: true, message: 'Transaction  deleted' })
    else
      json_response({ success: false, message: @transaction.errors }, :unprocessable_entity)
    end
  end

  private

  def set_user_account
    @user_account = UserAccount.find(params[:id])
  end

  def set_transaction
    @transaction = Transaction.find(params[:id])
  end

  def transaction_params
    params.require(:transaction).permit(:user_account_id, :loan_id, :property_id, :kind, :ref, :date, :time,
                                        :category, :description, :amount, :notes, :shares, :share_price)
  end

  def index_params
    params.require(:transaction).permit(:user_account_id)
  end

  def data_return(transaction)
    dt = Hash.new(0)
    dt[:id] = transaction.id
    dt[:amount] = transaction.amount
    dt[:user_account_id] = transaction.user_account.id
    dt[:kind] = transaction.kind
    dt[:category] = transaction.category
    dt[:data] = transaction.date

    dt
  end
end
