#json.array! @loans, partial: "loans/loan", as: :loan
json.success true

json.data @loans do |loan|
  json.partial! "api/v1/loans/loan", loan: loan
end

if params[:page]
  json.page params[:page]
  json.total_pages @total_pages
end
