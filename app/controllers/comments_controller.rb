class CommentsController < ApplicationController
  def create
    comment = Comment.new(comment_param)
    comment.post_id = params[:post_id]
    comment.user_id = current_user.id
    comment.save

    redirect_to :back
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy!

    redirect_to post_path(params[:post_id])
  end

  def comment_param
    params.require(:comment).permit(:content)
  end
end
