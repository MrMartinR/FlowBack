json.success true

json.data [@transaction] do |transaction|
  json.id transaction.id
  json.user_account transaction.user_account
  json.loan transaction.loan
  json.kind transaction.kind
  json.ref transaction.ref
  json.date transaction.date
  json.time transaction.time
  json.category transaction.category
  json.description transaction.description
  json.amount transaction.amount
  json.notes transaction.notes
  json.shares transaction.shares
  json.share_price transaction.share_price
end
