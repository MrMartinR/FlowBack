json.success true
json.data [@user_loan] do ||
json.partial! "api/v1/user_loans/user_loan", user_loan: @user_loan
end
