class HomesController < ApplicationController
  def top
    @events = Event.order(created_at: :desc).limit(4)
  end

  def about
  end
end
