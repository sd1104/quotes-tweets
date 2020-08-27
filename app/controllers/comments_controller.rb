class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to quote_path(params[:quote_id])
    else
      redirect_to quote_path(params[:quote_id])
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, quote_id: params[:quote_id])
  end
end
