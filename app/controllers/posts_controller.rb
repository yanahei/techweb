class PostsController < ApplicationController

  def index
    @posts = Post.all.order("created_at DESC").page(params[:page]).per(5)
  end
  
  def new
    @posts = Post.new
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
