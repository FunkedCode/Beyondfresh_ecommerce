# frozen_string_literal: true

json.extract! order, :id, :tax, :shipping, :sub_total, :total, :order_product_id, :order_status_id, :customer_id, :created_at, :updated_at
json.url order_url(order, format: :json)
