class GroupFollowsController < ApplicationController
  def create
    @group = Group.find(params[:group_id])
    @user = User.find(params[:user_id])

    if @group.users.include?(@user)
      @content =  Kernel.const_get(params[:content_type]).find(params[:content_id])
      if (@group.following?(@content))
        @group.stop_following(@content)
      else
        @group.follow(@content)
      end
    end

    respond_to do |format|
      format.html { redirect_to :back, notice: 'Content added to the group successfully' }
    end

  end

end

