class CreateCharacters < ActiveRecord::Migration
  def change
    create_table :characters do |t|
      t.string :name
      t.integer :id
      t.integer :comics
      t.integer :series
      t.integer :stories

      t.timestamps null: false
    end
  end
end
