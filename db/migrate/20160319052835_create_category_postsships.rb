class CreateCategoryPostsships < ActiveRecord::Migration
  def change
    create_table :category_postsships do |t|
      t.integer :category_id
      t.integer :post_id

      t.timestamps null: false
    end
    add_index :category_postsships, :category_id
    add_index :category_postsships, :post_id
  end
end
