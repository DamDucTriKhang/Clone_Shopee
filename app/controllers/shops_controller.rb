class ShopsController < ApplicationController
  before_action :find_shop, only: [:show, :edit, :update]

  def new
    if current_user.shop.present?
      flash[:danger] = t(".shop_already")
      return redirect_to shop_path(current_user.shop)
    end
    @shop = Shop.new
  end

  def show
    @check_shop = current_user.shop == @shop
    @count_products = @shop.products.count
    @products = @shop.products.page(params[:page]).per(5)
  end

  def create
    @shop = Shop.new(shops_params)
    if @shop.save
      flash[:success] = t(".shop_created")
      redirect_to shop_path(current_user.shop)
    else
      flash[:danger] = t(".shop_no_create")
      render :new
    end
  end

  def edit
    unless @shop.user == current_user
      flash[:danger] = t(".access")
      redirect_to root_path
    end
  end

  def update
    if @shop.update(shops_params)
      flash[:success] = t(".contact_update")
      redirect_to shop_path(current_user.shop)
    else
      flash[:danger] = t(".contact_fail_update")
      render :edit
    end
  end

  private

  def shops_params
    params.require(:shop).permit(:name, :description, :address, :phone, :user_id, :image)
  end

  def find_shop
    @shop = Shop.find_by(id: params[:id])
    if @shop.nil?
      flash[:danger] = t(".shop_fail_find")
      redirect_to new_shop_path
    end
  end
end
