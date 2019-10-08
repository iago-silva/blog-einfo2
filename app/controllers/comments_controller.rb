class CommentsController < ApplicationController
  before_action :set_post

  def create
  	@comment = @post.comments.create(comment_params)

  	redirect_to post_path(@post)
  end

  def destroy
  	@comment = Comment.find(params[:id])
  	@comment.destroy

  	redirect_to post_path(@post)
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def comment_params
  	params.require(:comment).permit(:comment).merge(user_id: current_user.id)
  end
end
