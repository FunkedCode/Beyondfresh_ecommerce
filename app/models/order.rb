# frozen_string_literal: true

class Order < ApplicationRecord
  has_many :order_products
  belongs_to :order_status
  belongs_to :customer

  validates :tax, :shipping, :sub_total, :total, presence: true
end
