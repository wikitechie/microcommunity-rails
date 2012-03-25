class PagesController < ApplicationController
  
  def home
    
    if current_user
      #instance variable used to initialize the form of the composer
      @wikipage = current_user.wikipages.new
      
      #fetching activites of followed users
      @following_users = current_user.following_users
      @following_users_ids = @following_users.map  do |user|
        user.id
      end
      @activities = Activity.where(:user_id => @following_users_ids)
      
      render "home"
      
    else
      render "welcome"
    end
          

    
    
  end

end
