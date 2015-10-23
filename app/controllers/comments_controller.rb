class CommentsController < ApplicationController

  def create
    @comment = current_user.comments.create!(comment_params)
  end

  def new
    @comment = current_user.comments.new
    render :new
  end


  private
    def comment_params
      params.require(:comment).permit(:content,:author_id,:post_id)
    end

end
