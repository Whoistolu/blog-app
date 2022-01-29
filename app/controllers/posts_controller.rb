class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts
  end

  def show
    @post = Post.find(params[:id])
    @user = @post.user
    @comments = @post.comments
  end

  def new
    @post = Post.new
  end

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
