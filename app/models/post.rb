class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments # @post = Post.find(xxx), @post.comments
  has_many :category_postsships
  has_many :categories, :through => :category_postsships
  has_many :likes
  has_many :like_users , :through=> :likes , :source => :user
  has_many :subscriptions
  has_many :subscriptions_users ,:through=> :subscriptions, :source =>:user


  def countpeople
    if self.brower_people.nil?
      self.brower_people = 1
    else
      self.brower_people += 1
    end
    self.save
  end
end
