class ProfilesController < ApplicationController
  def show
    @user =  User.find(params[:id])
    @wikipages = @user.wikipages
  end

  def index
  end

end
