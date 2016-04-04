class CreateFriends < ActiveRecord::Migration
  def change
    create_table :friends do |t|
      add_column :users , :friend_id , :integer
      add_column :users , :user_id , :integer
      t.timestamps null: false
    end
  end
end
