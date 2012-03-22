class ProfilesController < ApplicationController
  def show
    @user =  User.find(params[:id])
    @wikipages = @user.wikipages
    @wikipages.sort! { |a,b| a.updated_at <=> b.updated_at }

  end

  def index
  end

end
