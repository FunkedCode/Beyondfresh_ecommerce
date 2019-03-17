# frozen_string_literal: true

class OrderStatus < ApplicationRecord
  has_many :order
end
