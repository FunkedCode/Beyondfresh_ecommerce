class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :title
      t.decimal :price
      t.text :description
      t.string :image
      t.decimal :serving_size
      t.text :ingredient_list
      t.references :order_product, foreign_key: true
      t.references :product_attribute, foreign_key: true

      t.timestamps
    end
  end
end
