class HomesController < ApplicationController
  def top
    @events = Event.order(created_at: :desc).limit(4)
    @user = User.all
  end

  def about
  end
end
