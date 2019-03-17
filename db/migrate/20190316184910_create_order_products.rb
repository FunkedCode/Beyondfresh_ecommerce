# frozen_string_literal: true

class CreateOrderProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :order_products do |t|
      t.decimal :total_price
      t.integer :qty
      t.decimal :unit_price
      t.references :orders, foreign_key: true
      t.references :products, foreign_key: true

      t.timestamps
    end
  end
end
