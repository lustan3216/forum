class AddLogoToPosts < ActiveRecord::Migration
  def change
    add_attachment :posts, :logo
  end
end
