class ProductsController < ApplicationController
  before_action :authenticate_user!

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
  end

  def show
    @product = Product.find(params[:id])
  end
end
