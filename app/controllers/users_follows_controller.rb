class UsersFollowsController < ApplicationController
  def create
    @follower = User.find(params[:follower_user_id])
    @followed = User.find(params[:followed_user_id])

    if current_user == @follower
      if (@follower.following?(@followed))
        @follower.stop_following(@followed)
        notice = "You have unfollowed #{@followed.profile.name}"
      else
        @follower.follow(@followed)
        notice = "You are now following #{@followed.profile.name}"
      end

      respond_to do |format|
        format.html { redirect_to :back, notice: notice}
      end

    end



  end

end

