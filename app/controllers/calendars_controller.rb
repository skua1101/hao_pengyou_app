class CalendarsController < ApplicationController
  def index
     @calendar = Calendar.new
     @user = current_user
     @calendars = Calendar.where(user_id: current_user).order(start_time: "desc").kaminari_page(params[:page]).per(8)
  end

  def new
    @calendar = Calendar.new
  end

  def create
    calendar = Calendar.new(calendar_params)
   if  calendar.user_id = current_user.id
   	calendar.save
       flash[:notice] = "予定を記録しました"
 	    redirect_to calendars_path
   else
     render :index
   end
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
    params.require(:calendar).permit(:user_id, :calendar_title, :calendar_content, :start_time)
  end
end