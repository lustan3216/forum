class RemoveNotSuitId < ActiveRecord::Migration
  def change
    remove_column :profiles, :profile_id
    remove_column :comments, :comment_id
    remove_column :posts, :post_id
    remove_column :categories, :category_id
  end
end
