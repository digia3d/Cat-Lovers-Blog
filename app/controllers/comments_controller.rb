class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(params[:comment])
    @user = current_user
    @comment.users = @user

    @comment.save if @comment.valid?
    redirect_to user_posts_path(@user)
  end
end
