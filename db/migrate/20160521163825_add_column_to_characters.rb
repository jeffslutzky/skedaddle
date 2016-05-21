class AddColumnToCharacters < ActiveRecord::Migration
  def change
    add_column :characters, :thumbnail_path, :string
  end
end
