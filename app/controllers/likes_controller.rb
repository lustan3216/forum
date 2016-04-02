class LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post

  def create
    like = @post.likes.find_by_user_id(current_user)
    if !like
      @like = @post.likes.create!(:user => current_user)
    end
    # 為什麼要create要!
    respond_to do |format|
      format.html { redirect_to :back }
      format.js { render "posts/like" }
    end
  end

  def destroy
    #@like = current_user.likes.find( params[:id] )
    @like = @post.likes.find_by_user_id(current_user.id)

    # 為什麼js擋合在一起會有問題format.js { render "posts/create" }
    # 把like的內容放create裡面
    @like.destroy
    @like = nil # 這樣讓 topics/_like.html.erb 會顯示 Like 按鈕
    respond_to do |format|
      format.html { redirect_to :back }
      format.js { render "posts/like" }
    end
  end

  protected

  def set_post
    @post = Post.find(params[:post_id])
  end
end
