class Product < ApplicationRecord
  belongs_to :order_product
  belongs_to :product_attribute
end
