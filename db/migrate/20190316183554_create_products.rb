# frozen_string_literal: true

class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :title
      t.decimal :price
      t.text :description
      t.string :image
      t.decimal :serving_size
      t.text :ingredient_list

      t.timestamps
    end
  end
end
