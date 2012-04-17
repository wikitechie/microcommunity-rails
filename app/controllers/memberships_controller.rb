class MembershipsController < ApplicationController

  def create
    @membership = Membership.new(params[:membership])

    if @membership.save
      redirect_to @membership.group, :notice => "Welcome to the group of #{@membership.group}"
    end

  end

end

