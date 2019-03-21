# frozen_string_literal: true

class Category < ApplicationRecord
  has_many :product_categories
  has_many :products, through: :product_categories

  belongs_to :parent, class_name: 'Category', optional: true
  has_many :children, class_name: 'Category', foreign_key: 'parent_id'

  validates :name, uniqueness: true, presence: true
end
