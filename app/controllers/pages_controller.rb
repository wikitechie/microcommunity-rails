class PagesController < ApplicationController
  def home    
    @wikipage = current_user.wikipages.new
  end

end
