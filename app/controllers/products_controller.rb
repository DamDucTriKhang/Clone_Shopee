class ProductsController < ApplicationController
  before_action :find_product, only: [:edit, :update, :destroy]

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(products_params)
    if @product.save
      flash[:success] = t("controllers.products.create.product_created")
      redirect_to shop_path(current_user.shop)
    else
      flash[:danger] = t("controllers.products.create.product_no_create")
      render :new
    end
  end

  def edit
    if @product.shop.present?
      unless @product.shop.id == current_user.id
        flash[:danger] = t("controllers.products.edit.access")
        redirect_to shop_path(current_user.shop)
      end
    else
      flash[:danger] = t("controllers.products.edit.find_product")
      redirect_to new_product_path
    end
  end

  def update
    if @product.update(products_params)
      flash[:success] = t("controllers.products.update.product_update")
      redirect_to shop_path(current_user)
    else
      flash[:danger] = t("controllers.products.update.product_fail_update")
      render :edit
    end
  end

  def destroy
    @product.destroy
    flash[:success] = t("controllers.contacts.destroy.contact_delete")
    redirect_to shop_path(current_user)
  end



  private

  def products_params
    params.require(:product).permit(:name, :description, :price, :shop_id, :image)
  end

  def find_product
    @product = Product.find_by(id: params[:id])
    if @product.nil?
      flash[:danger] = t("controllers.shops.create.shop_fail_find")
      redirect_to shop_path (current_user.shop)
    end
  end
end
