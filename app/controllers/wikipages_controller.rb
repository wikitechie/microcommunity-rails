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
  
  def edit
    @wikipage = Wikipage.find(params[:id])    
  end
  
  def update
    @wikipage = Wikipage.find(params[:id])
    @wikipage.update_attributes(params[:wikipage])
    
    if @wikipage.save
      redirect_to @wikipage, notice: "Wikipage successfully edited"
    end
    
  end
  
end
