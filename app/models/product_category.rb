# frozen_string_literal: true

class ProductCategory < ApplicationRecord
  belongs_to :product
  belongs_to :category

  validates :product_name, :qty, presence: true
end
