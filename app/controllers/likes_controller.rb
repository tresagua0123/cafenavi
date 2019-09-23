class LikesController < ApplicationController

    before_action :set_variables, only:[:like, :unlike]
    def create
        @like = current_user.likes.create(post_id: params[:post_id])
        redirect_back(fallback_location: root_path)
    end
    def destroy
        @like = Like.find_by(post_id: params[:post_id], user_id: current_user.id)
        @like.destroy 
        redirect_back(fallback_location: root_path)
    end

    #added the codes below newly on 9/17

    def like
        like = current_user.likes.new(post_id: @post.id)
        like.save
    end

    def unlike
        like = current_user.likes.find_by(post_id: @post.id)
        like.destroy
    end

    private

    def set_variables
        @post = Post.find(params[:post_id])
        @id_name = "#like-link-#{@post.id}" 
        @id_heart = "#heart-#{@post.id}"

    end
end
