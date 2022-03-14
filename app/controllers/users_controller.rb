class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = current_user
    @user_events = @user.events
    @user_reservations = @user.reservations
  end

  def edit
    @user = User.find(params[:id])
    if @user == current_user
        render "edit"
    else
      redirect_to user_path(current_user)
    end
  end

  def update
    @user = current_user
    if @user.update(user_params)
      # flash[:notice] = "#{@customer.last_name}さんの情報を編集しました。"
      redirect_to user_path(current_user)
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :post_code, :address, :phone_number, :email,:nationality )
  end

end
