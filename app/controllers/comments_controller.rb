class CommentsController < ApplicationController
  def index
    @post = Post.find(params[:post_id])
    comments = @post.comments
  end

  def create 
    post = Post.find(params[:post_id])
    @comment = post.comments.build(comment_params)
    @comment.save!
  end

  def destroy
    post = Post.find(params[:post_id])
    comment = current_user.post.comments.find(params[:id])
    comment.destroy!
  end

  private
  def comment_params
    params.require(:comment).permit(:content)
  end
end