class LikesController < ApplicationController
  before_action :authenticate_user!

  def show
    post = Post.find(params[:post_id])
    like_status = current_user.hasliked?(post)
    
    rendef json: { hasLiked: like_status }
  end

  def create
    post = Post.find(params[:post_id])
    post.likes.create!(user_id: current_user.id)
    redirect_to root_path(post)
  end

  def destroy
    post = Post.find(params[:post_id])
    like = post.likes.find_by!(user_id: current_user.id)
    like.destroy!
    redirect_to root_path(post)
  end
end