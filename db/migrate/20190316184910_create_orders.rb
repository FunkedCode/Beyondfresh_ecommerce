class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.decimal :tax
      t.decimal :shipping
      t.decimal :sub_total
      t.decimal :total
      t.references :order_product, foreign_key: true
      t.references :order_status, foreign_key: true
      t.references :customer, foreign_key: true

      t.timestamps
    end
  end
end
