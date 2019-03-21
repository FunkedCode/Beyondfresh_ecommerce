# frozen_string_literal: true

json.extract! category, :id, :created_at, :updated_at, :is_main_category, :name
json.url category_url(category, format: :json)
