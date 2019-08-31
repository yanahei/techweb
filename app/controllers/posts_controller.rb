class PostsController < ApplicationController

  def index
    @posts = Post.all.search(params[:search]).order("created_at DESC").page(params[:page]).per(5)
  end
  
  def new
    @posts = Post.new
  end
  
  def show
    @post = Post.find(params[:id])
  end
  
  def search
    @posts = Post.search(params[:search])
  end
  
  def create
    @posts = Post.create!(create_params)
    @posts.save
    redirect_to controller: :posts, action: :index
  end
  
  private
  def create_params
    params.require(:post).permit(:title, :body, pdfs: [])
  end

end
