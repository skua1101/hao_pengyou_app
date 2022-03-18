class EventsController < ApplicationController
  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.user_id =current_user.id
    if@event.save
      # flash[:notice] = "#{@event.event_name}作成しました。"
      redirect_to user_path(current_user)
    else
      render :new
    end
  end

  def index
    @events = Event.kaminari_page(params[:page])
  end

  def show
    @event = Event.find(params[:id])
    @event.user_id = @event.user.id
  end

  def update
    # binding.irb
    # id から event を取得する
    @event = Event.find(params[:id])
    # 取得した event の event_status を更新する
    @event.event_status = params[:event_status]
    @event.save
    redirect_to user_path(current_user)

    # @event.update(event_params)
  end

  private

  def event_params
    params.require(:event).permit(:event_name, :venue, :event_address, :content, :user_id, :event_date, :image, :entry_fee, :entry_fee_detail, :event_status)
  end
end
