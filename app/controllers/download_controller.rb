class DownloadController < ApplicationController
  before_action :authenticate_user!
  
  def download
    products = Product.find(params[:product_id])
    send_data(products.data, filename: products.filename)
  end
end
