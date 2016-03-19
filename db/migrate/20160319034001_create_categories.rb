class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
      t.string :description
      t.integer :category_id

      t.timestamps null: false
    end
    add_index :categories , :category_id
  end
end
