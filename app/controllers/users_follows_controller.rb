class UsersFollowsController < ApplicationController
  def create
    @follower = User.find(params[:follower_user_id])
    @followed = User.find(params[:followed_user_id])

    if current_user == @follower
      if (@follower.following?(@followed))
        @follower.stop_following(@followed)
      else
        @follower.follow(@followed)
      end
    end

    respond_to do |format|
      format.html { redirect_to :back, notice: 'You are now following #{@follower.profile.name}' }
    end

  end

end

