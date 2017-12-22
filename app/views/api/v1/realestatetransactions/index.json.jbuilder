json.array! @transactions do |transaction|
  json.extract! transaction, :city, :state, :price
end