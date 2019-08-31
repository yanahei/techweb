class DownloadController < ApplicationController
  def download
    products = Product.find(params[:product_id])
    send_data(products.data, filename: products.filename)
  end
end
