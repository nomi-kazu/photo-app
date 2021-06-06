class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    user_ids = current_user.followings.pluck(:id)
    @posts = Post.where(user_id: user_ids)
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save!
      redirect_to posts_path(@post)
    else
      render :new
    end
  end

  def edit
    @post = current_user.posts.find(params[:id])
  end

  def update
    @post = current_user.posts.find(params[:id])
    if @post.update(post_params)
      redirect_to posts_path(@post)
    else
      render :new
    end
  end

  def destroy
    post = current_user.posts.find(params[:id])
    post.destroy!
    redirect_to root_path
  end

  private
  def post_params
    params.require(:post).permit(:content, images: [])
  end
end
