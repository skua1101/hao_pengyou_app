class ReservationsController < ApplicationController
  def index
  end

  def show
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
      redirect_to complete_reservations_path
    else
      render confirm_reservation_path
    end
  end

  def complete
    @user = current_user
  end

  private
  def reservation_params
    params.require(:reservation).permit(:user_id, :event_id)
  end
end