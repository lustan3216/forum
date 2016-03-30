class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments # @post = Post.find(xxx), @post.comments
  has_many :category_postsships
  has_many :categories, :through => :category_postsships

  def countpeople
    if self.brower_people.nil?
      self.brower_people = 1
    else
      self.brower_people += 1
    end
    self.save
  end

end
