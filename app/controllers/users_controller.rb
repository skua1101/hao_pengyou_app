class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    @user_events = @user.events.kaminari_page(params[:page]).per(4)
    @user_reservations = @user.reservations.kaminari_page(params[:page]).per(4)


    # 最新の４件のみ取得「.order('id DESC').limit(4)を追加」
    # @user_events = @user.events.order('id DESC').limit(4)
    # @user_reservations = @user.reservations.order('id DESC').limit(4)
  end

  def followed
    user = User.find(params[:id])
    @users = user.followings
  end

  def follower
    user = User.find(params[:id])
    @users = user.followers
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
