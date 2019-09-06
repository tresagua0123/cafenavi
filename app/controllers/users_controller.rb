class UsersController < ApplicationController
  before_action :authenticate_user!, only:[:show]
  def index
    @users = User.all.includes(:avatar_attachment)
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    user.update!(user_params)
    redirect_to users_url, notice: "ユーザーを更新しました。"
  end

  def user_params 
    params.require(:user).permit(:name, :avatar, :description)
  end
end
