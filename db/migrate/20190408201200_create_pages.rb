class CreatePages < ActiveRecord::Migration[5.2]
  def change
    create_table :pages do |t|
      t.string :body
      t.string :sub_content
      t.string :header

      t.timestamps
    end
  end
end
