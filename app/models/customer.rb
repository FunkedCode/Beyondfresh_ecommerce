# frozen_string_literal: true

class Customer < ApplicationRecord
  has_many :orders

  validates :first_name, :last_name, :user_name, :encrypted_password, :salt, presence: true
  validates :user_name, uniqueness: true
end
