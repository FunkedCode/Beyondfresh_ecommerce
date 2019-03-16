# frozen_string_literal: true

class Order < ApplicationRecord
  has_many :order_product
  belongs_to :order_status
  belongs_to :customer
end
