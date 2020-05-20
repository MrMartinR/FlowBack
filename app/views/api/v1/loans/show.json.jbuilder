json.success true
json.data [@loan] do
json.partial! "api/v1/loans/loan", loan: @loan
end
