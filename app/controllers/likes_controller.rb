class LikesController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    user = User.find(params[:user_id])

    @like = Like.new
    @like.author = current_user
    @like.post = post

    if @like.save
      flash[:success] = 'Liked!'
    else
      flash[:error] = 'Something went wrong...'
    end
    redirect_to user_post_path(user, post)
  end
end
