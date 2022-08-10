class LineItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_line_item, only: [:destroy]

  def create
    @product = Product.find(params[:product_id])
    @line_item = current_user.cart.line_items.build
    @line_item.price = @product.price
    @line_item.product_id = @product.id
    if @line_item.save
      flash.now[:success] = t(".product_created")
      redirect_to user_cart_path(current_user)
    end
  end

  def destroy
    @line_item.destroy
    flash[:success] = "Micropost deleted"
    redirect_to user_cart_path(current_user)
  end

  private

  def find_line_item
    @line_item = LineItem.find_by(id: params[:id])
    if @line_item.nil?
      flash[:danger] = t(".shop_fail_find")
      redirect_to cart_path (current_user.cart)
    end
  end

end
