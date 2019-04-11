# frozen_string_literal: true

json.extract! json_orders, :id, :tax, :shipping, :sub_total, :total, :product_ids, :order_status_id, :customer_id, :created_at, :updated_at
json.url order_url(json_orders, format: :json)
