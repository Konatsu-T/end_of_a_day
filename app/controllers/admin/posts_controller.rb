class Admin::PostsController < ApplicationController
  def index
  	@posts = Post.all
  end

  def show
  	@post = Post.find(params[:id])
    @posting_category = Category.where(category_status: :掲載中)
  end

  def destroy
  	@post = Post.find(params[:id])
  	@post.destroy
  	redirect_to admin_posts_path
  end

  # 各ユーザごとの投稿一覧
  def personal_post
    @user = User.find(params[:id])
    @posts = Post.all
  end

  private
  def post_params
  	params.require(:post).permit(:user_id, :title, :body, :category_id)
  end
end