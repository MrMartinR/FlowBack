#json.array! @loans, partial: "loans/loan", as: :loan
json.success true

json.data @user_loans do |user_loan|
  json.partial! "api/v1/user_loans/user_loan", user_loan: user_loan
end

if params[:page]
  json.page params[:page].to_i
  json.total_pages @total_pages
end
