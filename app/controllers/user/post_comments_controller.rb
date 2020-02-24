class User::PostCommentsController < ApplicationController
  before_action :authenticate_user!
  def create
  	@post = Post.find(params[:post_id])
  	@post_comment = @post.post_comments.build(post_comment_params)
  	@post_comment.user_id = current_user.id
  	if @post_comment.save
  		flash[:comment] = "コメントを投稿しました！"
  		render :index
  	else
  		render template: "user/posts/show"
  	end
  end

  def destroy
  	@post_comment = PostComment.find(params[:id])
  	if @post_comment.destroy
  	  render :index
  	end
  end

	private
	def post_comment_params
		params.require(:post_comment).permit(:user_id, :post_id, :comment)
	end
end