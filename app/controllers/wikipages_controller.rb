class WikipagesController < ApplicationController
  def index
    
  end
  
  def show
    @wikipage = Wikipage.find(params[:id])    
  end
  
  def create
    @user = current_user
    @user.wikipages.create!(params[:wikipage])
  end
end
