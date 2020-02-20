class Admin::PostCommentsController < ApplicationController
	def destroy
		@post_comment = PostComment.find(params[:id])
		@post_comment.destroy
		redirect_to admin_post_path(@post_comment.post)
	end

	def post_comment_params
		params.require(:post_comment).permit(:user_id, :post_id, :comment)
	end
end
