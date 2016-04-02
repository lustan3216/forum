class SubscriptionsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @subscription = @post.subscriptions.create!(:user => current_user)
    # find_by_user_id 是什麼用法
    # :user 可以替換成user_id嗎
    redirect_to :back
  end

  def destroy
    @post = Post.find(params[:post_id])
     @subscription = current_user.subscriptions.find(params[:id]).destroy
    # @subscription = @post.subscriptions.find(current_user).destroy
    redirect_to :back
  end
end
