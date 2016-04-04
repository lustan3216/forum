class PostCommentsController < ApplicationController
  before_action :find_post

  def create
    @comment = @post.comments.new(comment_params)
    @comment.user = current_user
    @comment.save
    # @comment.update(:user_id => current_user)
    # @comment.save
    respond_to do |format|
      format.html
      format.js { render "posts/create" }
    end
  end

  def destroy
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to post_path(@post) }
      format.js { render "posts/destroy" }
    end
  end

  private

  def find_post
    @post = Post.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:name,:user_id )
  end
end
