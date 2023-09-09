class CommentsController < ApplicationController
  
  def index
    
    @user = User.find(params[:user_id])
    @post = Post.find(params[:post_id])
    # @comments = Comment.all.where(post_id: @post.id ) 
    @comments = @post.comments  
    
    # render plain: "Hello, this is /comments  #{@comments} "
    # render plain: "Hello, this is /comments"

    render  @comments
  end 
  
  
  
  def new
    @user = User.find(params[:user_id])
    @post = Post.find(params[:id])
    @comment = Comment.new
  end

  def create
    @user = User.find(params[:user_id])
    @post = Post.find(params[:post_id])
    @comment = Comment.new(comment_params)

    @comment.author = @user
    @comment.post = @post

    if @comment.save
      redirect_to user_post_path(@user, @post)
    else
      puts 'NO SE PUDO GUARDAR ESTA CHINGADERA'
      puts @comment.errors.full_messages
      render 'new'
    end
  end

  def comment_params
    params.require(:comment).permit(:text)
  end
end
