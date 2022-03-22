class ReservationsController < ApplicationController

   before_action :authenticate_user!

  def index
    # どのイベントに紐づいているのか
    @event = Event.find(params[:id])
    # イベントに紐づいている予約のデータ
    @event_reservation = @event.reservations

  end

  def show
    @reservation = Reservation.find(params[:id])
    @user = @reservation.user
    @event = @reservation.event

  end

  def confirm
    @user = current_user
    @event = Event.find(params[:id])
  end

  def create
    @reservation = Reservation.new
    @reservation.user_id = current_user.id
    @reservation.event_id = params[:event_id]

    if@reservation.save
      flash[:notice] = "イベントの予約を完了しました。"
      redirect_to complete_reservations_path
    else
      render confirm_reservation_path
    end
  end

  def complete
    @user = current_user
  end

  def destroy
     @reservation  = Reservation.find(params[:id])
     @reservation.destroy
     flash[:notice] = "#{@reservation.event.event_name}の予約をキャンセルしました。"
     redirect_to user_path(current_user)
  end

  private
  def reservation_params
    params.require(:reservation).permit(:user_id, :event_id)
  end
end