# frozen_string_literal: true

class Product < ApplicationRecord
  has_many :order_product
  has_many :product_attribute
end
