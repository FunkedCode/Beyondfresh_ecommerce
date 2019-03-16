# frozen_string_literal: true

class ProductAttribute < ApplicationRecord
  belongs_to :product
  belongs_to :attribute
end
