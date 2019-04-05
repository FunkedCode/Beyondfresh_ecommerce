# frozen_string_literal: true

json.extract! customer, :id, :first_name, :last_name, :user_name, :salt, :hash, :order_id, :created_at, :updated_at
json.url customer_url(customer, format: :json)
