class AddBrowerPeopleToPosts < ActiveRecord::Migration
  def change
    add_column :posts , :brower_people ,:integer
  end
end
