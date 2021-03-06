class PagesController < ApplicationController

  def home

    unless current_user.nil?
      #fetching activites of followed users
      @following_users = current_user.following_users.push current_user
      @all_users = User.all
      @all_users_ids = @all_users.map do |user|
        user.id
      end
      @following_users_ids = @following_users.map  do |user|
        user.id
      end
      @activities = Activity.where(:user_id => @all_users_ids).order("updated_at DESC")

      @getting_started = false
      if @activities.count == 0
        @getting_started = true
      end

      @wikipages = Wikipage.limit(3)
      @people = Profile.limit(3)
      @groups = Group.limit(3)

      @posts_news_feed = Post.where(:owner_type => "User", :owner_id => @all_users_ids).order("created_at DESC")

      render "home"

    else
      render "welcome"
    end




  end

end

