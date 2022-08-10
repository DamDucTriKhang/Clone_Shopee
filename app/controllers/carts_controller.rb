class CartsController < ApplicationController

	def show
    @cart = User.find_by(id: params[:user_id]).cart
    if current_user.id == @cart.user_id
		  @line_items = current_user.cart.line_items
    else
      flash[:danger] = t("common.find_confirm")
      redirect_to user_cart_path (current_user)
    end
	end
end
