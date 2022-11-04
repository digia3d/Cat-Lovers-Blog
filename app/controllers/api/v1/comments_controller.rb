class Api::V1::CommentsController < ActionController::API
    protect_from_forgery with: :null_session
    before_action :authenticate_user!
    def index
      @post = Post.find(params[:post_id])
      @comments = @post.comments
      render json: @comments
    end
    def show
      @post = Post.find(params[:post_id])
      @comment = @post.comments.find(params[:id])
      render json: @comment
    end
    def create
      @post = Post.find(params[:post_id])
      @comment = @post.comments.new(comment_params)
      @comment.user_id = current_user.id
      if @comment.save
        render json: @comment
      else
        render json: {error: "Comment not saved"}
      end
    end
    def new
      @post = Post.find(params[:post_id])
      @comment = @post.comments.new
      render json: @comment
    end
    def destroy
      @post = Post.find(params[:post_id])
      @comment = @post.comments.find(params[:id])
      @comment.destroy
    end
    private
    def comment_params
      params.require(:comment).permit(:body)
    end
  end