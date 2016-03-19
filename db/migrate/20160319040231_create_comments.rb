class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string  :name
      t.boolean :is_public
      t.integer :comment_id
      t.integer :user_id

      t.timestamps null: false
    end
    add_index :comments , :comment_id
  end
end
