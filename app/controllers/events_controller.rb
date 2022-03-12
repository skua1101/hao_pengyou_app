class EventsController < ApplicationController
  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.user_id =current_user.id
    if@event.save
      # flash[:notice] = "#{@event.event_name}作成しました。"
      redirect_to users_path
    else
      render :new
    end
  end

  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  private

  def event_params
    params.require(:event).permit(:event_name, :venue, :event_address, :content, :user_id, :date, :image, :entry_fee, :entry_fee_detail, :event_status)
  end
end
