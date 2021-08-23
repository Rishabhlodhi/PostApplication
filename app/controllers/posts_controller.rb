class PostsController < ApplicationController

  #before_action :set_user, only: [:show, :edit, :update, :destroy]
  #before_action :ensure_current_user   
  #layout "lay"  
  #Get
  def index  
    @posts = Post.all
    #@posts = current_user.posts
    #@post = current_user.posts.build
    @post = Post.new
    
    respond_to do |format|
      format.html
      format.json{
        render json:@posts
      }
    end
  end
  
  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to root_path
    else
      flash.now[:error] ="not save"
    #render "posts"
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    respond_to do|format|
      format.html
      format.json{

      }
    end
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to root_path
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to root_path
  end

  private
    def post_params
      #params.require(:post).permit( :name, :body , :user_id)
      params.require(:post).permit( :name, :body )
    end

end
