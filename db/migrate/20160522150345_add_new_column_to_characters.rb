class AddNewColumnToCharacters < ActiveRecord::Migration
  def change
    add_column :characters, :url, :string
  end
end
