class ProductsController < ApplicationController

  def new
    @products = Product.new
  end

  def create
    @products = Product.new(products_params)
    if @products.save
      flash[:success] = t("controllers.shops.create.shop_created")
      redirect_to shop_path(current_user.shop)
    else
      flash[:danger] = t("controllers.shops.create.shop_no_create")
      render :new
    end
  end

  private

  def products_params
    params.require(:product).permit(:name, :description, :price, :shop_id, :image)
  end

  def find_shop
    @products = Product.find_by(id: params[:id])
    if @products.nil?
      flash[:danger] = t("controllers.shops.create.shop_fail_find")
      redirect_to shop_path (current_user.shop)
    end
  end
end
