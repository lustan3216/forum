class PostsController < ApplicationController
  before_action :find_post, :only => [:show, :destroy]
  before_action :authenticate_user!, :only => [:new, :create, :destroy]

  def index
    @posts = Post.order('id DESC').page(params[:page]).per(20)
  end

  def new
    @post = Post.new
    @category = Category.all
  end

  def create
    @post = current_user.posts.new(post_params)

    if @post.save
      redirect_to posts_path
    else
      render :new
    end
  end

  def show
    @comments = @post.comments
    @comment = Comment.new
    @post.countpeople
    @post.save
  end

  # def edit
  # end

  # def update
  # end

  def destroy
    @post.destroy
    redirect_to posts_path(:page => params[:page])
  end

  def collect

  end

  private

  def find_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:name, :description, :category_ids => [])
  end
end
