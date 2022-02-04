class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.includes(:comments)
  end

  def show
    @user = User.find(params[:user_id])
    @post = @user.posts.includes(comments: [:user]).find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    new_post = current_user.posts.new(post_params)

    if new_post.save
      redirect_to user_posts_path(new_post.user.id, new_post.id)
    else
      render :new, alert: 'Error occured!'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy!
    flash[:success] = 'You have deleted this post!'
    redirect_to user_path(current_user.id)
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
