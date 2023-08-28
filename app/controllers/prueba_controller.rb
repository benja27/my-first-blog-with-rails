class PruebaController < ApplicationController
  def index
    @users = User.all()
    puts @users
  end
  def show
    @user = User.find(params[:id])
  end
end
