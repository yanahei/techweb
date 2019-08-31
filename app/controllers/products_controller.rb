class ProductsController < ApplicationController
  
  def new
    @product = Product.new
  end
  
  def show
    @products = Product.all.order("created_at DESC").limit(1)
  end
  
  def create
    upload_file = create_params[:data]
    content = {}
    content[:data] = upload_file.read
    content[:filename] = upload_file.original_filename
    @product = Product.new(content)
    if @product.save
      redirect_to controller: :posts, action: :index
    end
  end
  
  def download
    products = Product.find(params[:product_id])
    send_data(products.data, filename: products.filename)
  end
  
  private
  def create_params
    params.require(:product).permit(:data)
  end
end
