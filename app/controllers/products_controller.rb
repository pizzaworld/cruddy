class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    Product.create name: params[:product][:name]
    redirect_to :products
  end
end
