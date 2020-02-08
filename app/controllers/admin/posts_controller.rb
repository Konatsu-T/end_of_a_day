class Admin::PostsController < ApplicationController
  def index
  	@posts = Post.all
  end

  def show
  	@post = Post.find(params[:id])
  end

  def destroy
  	@post = Post.find(params[:id])
  	@post.destroy
  	redirect_to admin_posts_path
  end

  private
  def post_params
  	params.require(:post).permit(:user_id, :title, :body, :category_id)
  end
end