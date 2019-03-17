json.extract! product, :id, :title, :price, :description, :image, :serving_size, :ingredient_list, :order_product_id, :product_attribute_id, :created_at, :updated_at
json.url product_url(product, format: :json)
