class ProductsController < ApplicationController
  before_action :get_product, only: [:show, :edit, :update, :destroy]

  def index
    @products = Product.all
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to products_path
    else
      render :new
    end
  end

  def new
    @product = Product.new
  end

  def show
  end

  def edit
  end

  def update
    if @product.update_attributes(product_params)
      redirect_to products_path
    else
      render :edit
    end
  end

  def destroy
  end

  def product_params
    params.require(:product).permit(:name, :description, :price, :available, :discontinue_on, :image)
  end

  def get_product
    @product = Product.find(params[:id]) rescue nil
    if @product.blank?
      redirect_to products_path
    end
  end
end
