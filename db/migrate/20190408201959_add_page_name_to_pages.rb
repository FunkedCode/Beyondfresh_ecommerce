class AddPageNameToPages < ActiveRecord::Migration[5.2]
  def change
    add_column :pages, :page_name, :string
  end
end
