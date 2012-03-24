class PagesController < ApplicationController
  before_filter :authenticate_user!
  def home    
    @wikipage = current_user.wikipages.new
    
    #activites of followed users
    @following_users = current_user.following_users
    @following_users_ids = @following_users.map  do |user|
      user.id
    end
    @activities = Activity.where(:user_id => @following_users_ids)
    
    
  end

end
