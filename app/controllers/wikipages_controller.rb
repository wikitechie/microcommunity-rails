class WikipagesController < ApplicationController
  def index
    @wikipages = Wikipage.find(:all, :order => "updated_at ASC")
  end
  
  def show
    @wikipage = Wikipage.find(params[:id])    
  end
  
  def create
    @user = current_user
    @wikipage = @user.wikipages.create!(params[:wikipage]) 
    
    respond_to do |format|
      if @wikipage.save
        format.html { redirect_to @wikipage, notice: 'Post was successfully created.' }
        format.js
      end
    end   
  end
end
