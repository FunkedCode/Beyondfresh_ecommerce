class Order < ApplicationRecord
  belongs_to :order_product
  belongs_to :order_status
  belongs_to :customer
end
