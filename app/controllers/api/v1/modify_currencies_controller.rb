class Api::V1::ModifyCurrenciesController < Api::BaseController
  before_action :authenticate_api_v1_user!
  before_action :admin_or_contributor!
  before_action :set_account, only: %i[update destroy]
  # assumption:
  # 1. validation between existing and none existing is done on the frontend

  def update
    if @account && !update_account_params[:currency_id].empty?
      update_account_params[:currency_id].each do |i|
        @account.currency_id << i
        json_response({ "status": 'SUCCESS', "messages": 'Currency added' }) if @account.save
      end
    else
      json_response({ "status": 'FAIL', "messages": 'The account was not found or the params are empty' })
    end
  end

  def destroy
    if @account && !update_account_params[:currency_id].empty?
      update_account_params[:currency_id].each do |i|
        @account.currency_id.delete(i)
        json_response({ "status": 'SUCCESS', "messages": 'Currency deleted' }) if @account.save
      end
    else
      json_response({ "status": 'FAIL', "messages": 'The account was not found or the params are empty' })
    end
  end

  private

  def set_account
    @account = Account.find(params[:id])
  end

  def update_account_params
    params.require(:account).permit(currency_id: [])
  end
end
