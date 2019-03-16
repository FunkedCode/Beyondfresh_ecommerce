# frozen_string_literal: true

class OrderProduct < ApplicationRecord
  belongs_to :order
  has_many :product
end
