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
    flash[:notice] = "予定を記録しました"
    redirect_to calendars_path
  end

  def edit
  end

  def update
    if @calendar.update(calendar_params)
       flash[:notice] = "予定を更新しました"
       redirect_to calendars_path
    else
       render :edit
    end
  end

  def destroy
    @calendar = Calendar.find(params[:id])
    @calendar.destroy
    flash[:notice] = "予定を削除しました"
	  redirect_to calendars_path
  end


  private

  def calendar_params
    params.require(:calendar).permit(:calendar_title, :calendar_content, :start_time)
  end
end