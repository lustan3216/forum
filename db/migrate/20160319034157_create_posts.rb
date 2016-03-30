class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :name
      t.text :description
      t.boolean :is_public
      t.integer :post_id
      t.integer :user_id

      t.timestamps null: false
    end
    add_index :posts , :post_id
  end
end

