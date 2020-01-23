class ProductsController < ApplicationController

  def index
    @products = Product.includes(:images).order('created_at DESC')
  end

  def new
    @product = Product.new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
    @product = Product.find(params[:id])
    if @product.user_id == current_user.id
      @product.destroy
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  def show
    @product = Product.find(params[:id])
    @contents = Product.includes(:images).order('created_at DESC')
  end
end
