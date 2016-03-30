class Category < ActiveRecord::Base
  has_many :category_postsships
  has_many :posts , :through => :category_postsships
end
