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

  def new
    @user = User.find(1)
    @post = Post.new 
  end

  def create
    @user = User.find(params[:user_id])

    @post = current_user.posts.build(post_params) # Assuming you have a relationship between users and posts
  
    if @post.save
      # Handle successful creation, e.g., redirect to a show page
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end
  
  private
  
  def post_params
    params.require(:post).permit(:title, :text)
  end
  
end
