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
    @reservation = reservation.confirm
    @reservation.save
  end

  def complete
    @user =current_user
  end
end
