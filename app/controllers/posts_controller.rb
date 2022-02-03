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
    @post = current_user.posts.new
    render :new, locals: { post: @post }
  end

  def create
    new_post = current_user.posts.new(post_params)
    new_post.likes_counter = 0
    new_post.comments_counter = 0
    new_post.update_posts_counter
    respond_to do |format|
      format.html do
        if new_post.save
          redirect_to "/users/#{new_post.user.id}/posts/", notice: 'Success!'
        else
          render :new, alert: 'Error occured!'
        end
      end
    end
  end

  private

  def post_params
    params.require(:data).permit(:title, :text)
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy!
    flash[:success] = 'You have deleted this post!'
    redirect_to user_posts_url
  end
end
