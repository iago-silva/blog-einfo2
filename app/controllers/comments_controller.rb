class CommentsController < ApplicationController
  def create
  	@post = Post.find(params[:post_id])
  	@comment = @post.comments.build(comment_params)
  	@comment.save

  	redirect_to post_path(@post)
  end

  def destroy
  	@comment = Comment.find(params[:id])
  	@comment.destroy

  	redirect_to post_path(@comment.post)
  end

  private

  def comment_params
  	params.require(:comment).permit(:name, :comment)
  end
end
