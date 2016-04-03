class PostsController < ApplicationController
  before_action :find_post, :only => [:show, :destroy, :edit, :update]
  before_action :authenticate_user!, :only => [:new, :create, :destroy, :edit, :update]

  def index
    #Post.joins(:comments)
    #Post.select('posts.all, max(comments.created_at) as last_comment')
    #Post.group('posts.id')
    #Post.order('last_comment desc')
    @posts = Post.all
    if params[:sort] == "replytime"
      @posts = Post.order('last_comment desc, topics.created_at desc')
    elsif params[:sort] == "replys"
      @posts = Post.order('brower_people DESC, created_at DESC')
    elsif params[:sort] == "browers"
      @posts = Post.order('brower_people DESC, created_at DESC')
    else params[:sort] == "createtime"
      @posts = Post.order('id DESC')
    end
    @posts = @posts.page(params[:page]).per(20)
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
    if params[:destroy_logo]
      @event.logo = nil
      @event.save
    end
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
    params.require(:post).permit(:name,:logo, :is_public, :description, :category_ids => [])
  end
end
