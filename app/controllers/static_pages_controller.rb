class StaticPagesController < ApplicationController

	def home
    @products = Product.all.page(params[:page]).per(10)
	end
end
