json.extract! product, :id, :title, :sold, :category_id, :user_id, :description, :price, :colour, :condition, :listed_date, :created_at, :updated_at
json.url product_url(product, format: :json)
json.description product.description.to_s
