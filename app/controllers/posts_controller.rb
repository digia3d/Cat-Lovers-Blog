class PostsController < ApplicationController
  def index
    @user = User.includes(posts: [:comments]).find(params[:user_id])
  end

  def show
    @post = Post.find(params[:id])
    @user = User.find(params[:user_id])
    @like = Like.new
  end

  def new
    @post = Post.new
  end

  def create
    user = User.find(params[:user_id])

    post = Post.new(post_params)
    post.author = current_user
    post.likes_counter = 0
    post.comments_counter = 0

    if post.save
      redirect_to user_posts_path(user, post)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    @user = current_user
    @user.posts_counter -= 1
    @user.save
    redirect_to user_posts_path(current_user)
  end

  private

  def post_params
    params.require(:new_post).permit(:title, :text)
  end
end
