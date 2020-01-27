class ProductsController < ApplicationController
  before_action :set_product, only: [:destroy, :show]

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
    if @product.user_id == current_user.id && @product.destroy
      redirect_to root_path
    end
  end

  def show
    @contents = Product.includes(:images).order('created_at DESC')
  end

  def search
    @search = params[:search]
    @products = Product.search(@search)
  end

  def set_product
    @product = Product.find(params[:id])
  end
end