class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @post = Post.find(params[:post_id])
    new_comment = @post.comments.new(
      text: comment_params,
      user_id: current_user.id
    )
    new_comment.update_comments_counter
    if new_comment.save
      redirect_to "/users/#{@post.user_id}/posts/#{@post.id}", notice: 'Success!'
    else
      render :new, alert: 'Error occured!'
    end
  end

  def destroy
    @comment = Comment.find(params[:commnet_id])
    @comment.destroy!
    flash[:success] = 'You have deleted this post!'
    redirect_to user_path(current_user.id)
  end

  private

  def comment_params
    params.require(:comment).permit(:text)[:text]
  end
end
