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

  def edit
    @product = Product.find params[:id]
  end

  def update
    @product = Product.find params[:id]
    @product.update name: params[:product][:name]
    redirect_to :products
  end

  def destroy
    @product = Product.find params[:id]
    @product.destroy
    redirect_to :products
  end

  def show
    @product = Product.find params[:id]
  end
end
