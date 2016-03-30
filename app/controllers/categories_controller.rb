class CategoriesController < ApplicationController
  def index
    @categorys = Category.all
  end

  def show
    @categorys = Category.all
    @category = Category.find(params[:id])
    @posts = @category.posts
  end
end
