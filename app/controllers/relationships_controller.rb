class RelationshipsController < ApplicationController
  def create
    follow = current_user.active_relationships.build(follower_id: params[:user_id])
    follow.save
    @user = User.find(params[:user_id])
    @user.create_notification_follow!(current_user) #追記部分
    redirect_back fallback_location: root_path
  end

  def destroy
    follow = current_user.active_relationships.find_by(follower_id: params[:user_id])
    follow.destroy
    redirect_back fallback_location: root_path
  end
end
