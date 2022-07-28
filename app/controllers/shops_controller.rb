class ShopsController < ApplicationController
  before_action :find_shop, only: [:show, :edit, :update]

  def new
    @shop = Shop.new
    if current_user.shop.present?
      flash[:danger] = "shop đã tồn tại"
      redirect_to shop_path(current_user)
    end
  end

  def show
    @products = @shop.products
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

  def edit
    if @shop.present?
      unless @shop.user.id == current_user.id
        flash[:danger] = t("controllers.contacts.edit.access")
        redirect_to root_path
      end
    else
      flash[:danger] = t("controllers.contacts.edit.find_contact")
      redirect_to new_shop_path
    end
  end

  def update
    if @shop.update(shops_params)
      flash[:success] = t("controllers.contacts.update.contact_update")
      redirect_to shop_path(current_user)
    else
      flash[:danger] = t("controllers.contacts.update.contact_fail_update")
      render :edit
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
      redirect_to shop_path(current_user.shop)
    end
  end
end
