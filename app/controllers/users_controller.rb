class UsersController < ApplicationController
  # before_action :authenticate_user!

  def index
    @users = User.all
    render json: @users
  end

  def show
    @user = User.find(params[:id])
    @users = User.all
    @current_user = current_user
    render json: @user
  end

  def destroy
    # Sign out the user
    sign_out current_user

    # Redirect to the home page
    redirect_to root_path
  end
end
