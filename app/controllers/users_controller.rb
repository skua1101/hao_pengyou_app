class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = current_user
  end

  def edit
    @customer = current_user
    redirect_to users_path(current_user) unless current_user == @user
  end

  def update
  end

  private

  def user_params
    params.require(:user).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :post_code, :address, :phone_namber, :email,:nationality )
  end

end
