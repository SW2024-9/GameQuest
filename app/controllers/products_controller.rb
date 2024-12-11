class ProductsController < ApplicationController
  def index
    @products = Product.all.presence || []
  end

  def new
    @product = Product.new
  end
  
  def create
    p = Product.new(file: params[:product][:file].read, name: params[:product][:name], price: params[:product][:price], explanation: params[:product][:explanation])
    p.save
    redirect_to root_path
  end
  
  def destroy
    Product.find(params[:id]).destroy
    redirect_to root_path
  end
  
  def get_image
    image = Product.find_by(params[:id])
    send_data image.file, disposition: :inline, type: 'image/png'
  end
  
end
