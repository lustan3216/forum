class PostsController < ApplicationController
  before_action :find_post, :only => [:show, :destroy, :edit, :update]
  before_action :authenticate_user!, :only => [:new, :create, :destroy, :edit, :update]

  def index
    @posts = Post.order('id DESC').page(params[:page]).per(20)
    # 要怎麼用find or where 找出is_public =>nil 和 false
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

  def edit
  end

  def update
    @post.update(post_params)
    redirect_to user_profile_path(@post.user_id)
  end

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
    params.require(:post).permit(:name, :is_public, :description, :category_ids => [])
  end
end
