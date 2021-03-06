class PostsController < ApplicationController
  protect_from_forgery except: :create
  before_action :authenticate_user!, only:[:create, :show]
  def index
    
    @q = Post.ransack(params[:q])
    @posts = @q.result.includes(:prefecture,  :image_attachment, :user).group('posts.id').page(params[:page]).per(6)
    

    @prefectures = Prefecture.all
    @tags = Tag.all

    @like = Like.new



  end
  
  def new
    @post = Post.new
    @q = Post.ransack(params[:q])
    @prefectures = Prefecture.all
    @tags = Tag.all
  end

  def show
    @post = Post.find(params[:id])
    @like = Like.new

    @comment = Comment.new
    @comments = Comment.all


  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.latitude = -34.397
    @post.longitude = 150.644

    if @post.save
      redirect_to posts_url, notice: "レビューが投稿されました。"
    else 
      @prefectures = Prefecture.all
      render :new
    end


  end

  def destroy
    post = Post.find(params[:id])
    post.destroy 
    redirect_to posts_url, notice: "ポストを削除しました。"
  end

  def map
    # respond_to以下の記述によって、
    # remote: trueのアクセスに対して、
    # map.js.erbが変えるようになります。
    respond_to do |format|
      format.js
    end
  end


  private
  def post_params 
    params.require(:post).permit(:title, :description,
     :address, :latitude, :longitude, :prefecture_id, :image,
      :prefecture_id_eq, :tags_id_matches_in, tag_ids:[]) #:prefecture_id を除外
  end
  def search_params
    params.require(:q).permit!
  end
end
