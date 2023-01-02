class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    user = User.find(params[:user_id])
    post = Post.find(params[:post_id])

    comment = Comment.new(comment_params)
    comment.author = current_user
    comment.post = post

    if comment.save
      flash[:success] = 'Comment created!'
      redirect_to user_post_path(user, post)
    else
      flash[:error] = 'Something went wrong...'
      render :new
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @post = Post.find(@comment.post_id)
    @post.comments_counter -= 1
    @comment.destroy!
    @post.save!
    redirect_to user_post_path(current_user, params[:post_id])
  end

  private

  def comment_params
    params.require(:new_comment).permit(:text)
  end
end
