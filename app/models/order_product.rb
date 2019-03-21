# frozen_string_literal: true

class OrderProduct < ApplicationRecord
  belongs_to :order
  has_many :products

  validates :total_price, :qty, :unit_price, presence: true
end
