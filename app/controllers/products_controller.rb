class ProductsController < ApplicationController
  before_action :find_product, only: [:edit, :update, :destroy]

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(products_params)
    if @product.save
      flash[:success] = t(".product_created")
      redirect_to shop_path(current_user.shop)
    else
      flash.now[:danger] = t(".product_no_create")
      render :new
    end
  end

  def edit
    unless @product.shop == current_user.shop
      flash[:danger] = t(".access")
      redirect_to shop_path(current_user.shop)
    end
  end

  def update
    if @product.update(products_params)
      flash[:success] = t(".product_update")
      redirect_to shop_path(current_user.shop)
    else
      flash[:danger] = t(".product_fail_update")
      render :edit
    end
  end

  def destroy
    @product.destroy
    flash[:success] = t(".product_delete")
    redirect_to shop_path(current_user.shop)
  end



  private

  def products_params
    params.require(:product).permit(:name, :description, :price, :shop_id, :image)
  end

  def find_product
    @product = Product.find_by(id: params[:id])
    if @product.nil?
      flash[:danger] = t(".shop_fail_find")
      redirect_to shop_path (current_user.shop)
    end
  end
end
