class ProductsController < ApplicationController

  def index
    list
    render :action => 'list'
  end

  def list
    @products = Product.find(:all, :order => :product_number)
  end

  def show
    @product = Product.find(params[:id])
  end

end
