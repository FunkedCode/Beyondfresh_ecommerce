# frozen_string_literal: true

class CreateAttributes < ActiveRecord::Migration[5.2]
  def change
    create_table :attributes do |t|
      t.string :name

      t.timestamps
    end
  end
end
