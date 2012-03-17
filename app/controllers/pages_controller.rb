class PagesController < ApplicationController
  before_filter :authenticate_user!
  def home    
    @wikipage = current_user.wikipages.new
  end

end
