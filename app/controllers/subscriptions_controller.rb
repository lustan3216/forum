class SubscriptionsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @subscription = @post.subscriptions.create!(:user => current_user)
    # find_by_user_id 是什麼用法
    # :user 可以替換成user_id嗎
    respond_to do |format|
      # format.html { redirect_to :back }
      format.js { render "posts/subscription" }
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @subscription = current_user.subscriptions.find(params[:id])
    @subscription.destroy
    @subscription = nil
    # @subscription = @post.subscriptions.find(current_user).destroy
    respond_to do |format|
      # format.html { redirect_to :back }
      format.js { render "posts/subscription" }
    end
  end
end
