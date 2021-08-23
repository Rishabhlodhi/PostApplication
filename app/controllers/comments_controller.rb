class CommentsController < ApplicationController
  def new
    @comments = Comment.new
  end
   

  def create
    #byebug
    @post = Post.find(params[:post_id])
     @comment = @post.comments.create(comment_params.merge(user_id: current_user.id))
      redirect_to '/posts'
  end

    
  def edit
    @post = Post.find(params[:post_id])
     @comment = @post.comments.find(params[:id])
  end

  def update
    @post= Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
      if @comment.update(comment_params)
        redirect_to '/posts'
      else
      end
  end

  def destroy
    @post = Post.find(params[:post_id])
      @comment = @post.comments.find(params[:id])
      @comment.destroy
        redirect_to '/posts'
  end
    
private
  def comment_params
    params.require(:comment).permit(:name, :body ,:user_id)
  end
end
