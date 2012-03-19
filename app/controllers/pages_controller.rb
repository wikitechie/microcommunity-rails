class PagesController < ApplicationController
  before_filter :authenticate_user!
  def home    
    @wikipage = current_user.wikipages.new
    
    #code to fetch friends' wikipages
    @friends_wikipages = []
    current_user.friends.each do |friend|
      friend.wikipages.each do |wikipage|
        @friends_wikipages.push(wikipage)
      end     
    end
    
  end

end
