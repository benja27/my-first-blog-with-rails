class CommentsController < ApplicationController
  def index
    @post = Post.find(params[:post_id])
    @comments = @post.comments

    # Create an API endpoint to list all comments for a user's post.
    render json: @comments
  end

  def new
    @user = User.find(params[:user_id])
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end

  def create
    # response tru the api in json format
    @user = User.find(params[:user_id])
    @post = Post.find(params[:post_id])
    # this is for api conecction
    json_request = JSON.parse(request.body.read)
    text = json_request['text']
    author = @post.author

    if text.present? # Verify that the text is not empty
      @comment = @post.comments.new(text:, author:)

      if @comment.save
        render json: @comment, status: :created
      else
        render json: { error: 'Invalid comment' }, status: :unprocessable_entity
      end
    else
      render json: { error: 'Text cannot be empty' }, status: :unprocessable_entity
    end
    # this is for html conection
    #   @user = User.find(params[:user_id])
    #   @post = Post.find(params[:post_id])
    #   @comment = Comment.new(comment_params)

    #   @comment.author = @user
    #   @comment.post = @post

    #   if @comment.save
    #     redirect_to user_post_path(@user, @post)
    #   else
    #     puts 'NO SE PUDO GUARDAR ESTA CHINGADERA'
    #     puts @comment.errors.full_messages
    #     render 'new'
    #   end
  end

  def comment_params
    params.require(:comment).permit(:text)
  end
end
