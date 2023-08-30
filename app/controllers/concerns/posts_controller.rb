class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @users = User.all
  end

  def show
    @user = User.find(params[:user_id])
    @users = User.all
    @post = Post.find(params[:id])
  end
end
