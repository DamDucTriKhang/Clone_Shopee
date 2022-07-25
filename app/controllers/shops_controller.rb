class ShopsController < ApplicationController

  def new
    @shop = Shop.new
  end

  def create
    @shop = Shop.new(shops_params)
    if @shop.save
      flash[:success] = t("controllers.shops.create.shop_created")
      redirect_to shop_path(current_user)
    else
      flash[:danger] = t("controllers.shops.create.shop_no_create")
      render :new
    end
  end

  private

  def shops_params
    params.require(:shop).permit(:name, :description, :address, :phone, :user_id)
  end

  def find_shop
    @shop = Shop.find_by(id: params[:id])
    if @shop.nil?
      flash[:danger] = t("controllers.shops.create.shop_fail_find")
      redirect_to shop_path
    end
  end
end
