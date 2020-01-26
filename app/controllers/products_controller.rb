class ProductsController < ApplicationController
  # before_action :authenticate_user!, only: [:new]
  # before_action :set_product, except: [:index, :new, :create]
  def index
    @products = Product.includes(:images).order('created_at DESC')
  end

  def new
    @product = Product.new
    @product.images.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
  end

  private
  def product_params
    params.require(:product).permit(:image, :name, :detail, :brand, :size, :price, :status, :situation, :postage, :method, :area, :category_parents, :category_children, :category_grand_children, images_attributes: [:src, :_destroy, :id])
  end

  # def product_params
  #   params.require(:product).permit(images_attributes: [:src, :_destroy, :id])
  # end

  def set_product
    @product = Product.find(params[:id])
  end
end