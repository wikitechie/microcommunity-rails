class CommentsController < ApplicationController
  def create
    @comment = Comment.build_from( Post.find(params[:comment][:post_id]), current_user.id, params[:comment][:body] )
      respond_to do |format|
        if @comment.save
          format.js
        end
      end
  end

end

