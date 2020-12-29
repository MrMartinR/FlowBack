#json.array! @loans, partial: "loans/loan", as: :loan
json.success true

json.data @user_loans do |user_loan|
  json.id user_loan.id
  json.loan user_loan.loan
  json.user_account user_loan.user_account
  json.slice_name user_loan.slice_name
  json.market user_loan.market
  json.xirr user_loan.xirr
  json.investment_amount user_loan.investment_amount
  json.invest_mode user_loan.invest_mode
  json.position user_loan.position
  json.date_in user_loan.date_in
  json.date_out user_loan.date_out
end


