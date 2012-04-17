class GroupFollowsController < ApplicationController
  def create

    puts params.to_s
    @group = Group.find(params[:group_id])
    @user = User.find(params[:user_id])

    if @group.users.include?(@user)
      @content =  Kernel.const_get(params[:content_type]).find(params[:content_id])
      @group.follow(@content)
    end

    respond_to do |format|
      format.html { redirect_to :back, notice: 'Content added to the group successfully' }
    end

  end

end

