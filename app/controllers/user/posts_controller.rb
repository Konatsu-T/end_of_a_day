class User::PostsController < ApplicationController
	def new
		@user = current_user
		@post = Post.new
	end

	def index
		@posts = Post.all
	end

	def show
		@post = Post.find(params[:id])
	end

	def create
		@post = Post.new(post_params)
		if @post.save
			redirect_to user_post_path(@post.id), notice: "投稿しました！"
		else
			render :new
		end
	end

	def update
		@post = Post.find(params[:id])
		if @post.update
			redirect_to user_post_path(@user)
		else
			render :edit
		end
	end

	def destroy
		@post = Post.find(params[:id])
		@post = destroy
		redirect_to user_posts_path
	end

  private
  def post_params
  	params.require(:post).permit(:user_id, :title, :body, :category_id)
  end
end
