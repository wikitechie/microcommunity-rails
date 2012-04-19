class PagesController < ApplicationController

  def home

    unless current_user.nil?
      #fetching activites of followed users
      @following_users = current_user.following_users
      @following_users_ids = @following_users.map  do |user|
        user.id
      end
      @activities = Activity.where(:user_id => @following_users_ids).order("updated_at DESC")

      render "home"

    else
      render "welcome"
    end




  end

end

