class CalendarsController < ApplicationController
  def index
     @calendar = Calendar.new
     @calendars = Calendar.all
  end

  def new
    @calendar = Calendar.new
  end

  def create
    Calendar.create(calendar_params)
    redirect_to calendars_path
  end

  private

  def calendar_params
    params.require(:calendar).permit(:calendar_title, :calendar_content, :start_time)
  end
end