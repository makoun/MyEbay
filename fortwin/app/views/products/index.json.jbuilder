json.array!(@products) do |product|
  json.extract! product, :id, :title, :description, :price, :rate, :img
  json.url product_url(product, format: :json)
end
