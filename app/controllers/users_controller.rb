class UsersController < ApplicationController
	# before_filter :authenticate_user!

	def index
	end

	def show
	end

	def edit
    @user = User.find(params[:id])
    unless @user.id == current_user.id
      flash[:danger] = "You do not have access"
    end
	end

  def update
    if current_user.update(user_params)
      flash[:success] = "User updated!"
      sign_in(current_user, :bypass => true)
      redirect_to user_path(current_user)
    else
      flash[:danger] = "User no update!"
      render :show
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

end
