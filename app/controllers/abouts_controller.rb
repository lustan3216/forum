class AboutsController < ApplicationController
  def index
    @user = User.all.size
    @categories = Category.all.size
    @comments = Comment.all.size
  end
end
