class PostsController < ApplicationController
  protect_from_forgery except: :create
  before_action :authenticate_user!, only:[:create, :show]
  def index
    @posts = Post.all 
    @post = Post.new
    @like = Like.new
  end

  def show
    @post = Post.find(params[:id])
    @like = Like.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_back(fallback_location: root_path)
    else 
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy 
    redirect_to posts_url, notice: "ポストを削除しました。"
  end

  private
  def post_params 
    params.require(:post).permit(:content)
  end
end
