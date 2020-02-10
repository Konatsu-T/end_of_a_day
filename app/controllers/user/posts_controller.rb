class User::PostsController < ApplicationController
	def new
		@post = Post.new
		@posting_category = Category.where(category_status: :掲載中)
	end

	def index
		@posts = Post.all
	end

	def show
		@post = Post.find(params[:id])
	end

	def create
		@post = Post.new(post_params)
		@posting_category = Category.where(category_status: :掲載中)
		@post.user_id = current_user.id
		if @post.save
			redirect_to user_post_path(@post), notice: "投稿しました！"
		else
			render :new
		end
	end

	def edit
		@post = Post.find(params[:id])
		@posting_category = Category.where(category_status: :掲載中)
	end

	def update
		@post = Post.find(params[:id])
		@posting_category = Category.where(category_status: :掲載中)
		if @post.update(post_params)
			redirect_to user_post_path(@post)
		else
			render :edit
		end
	end

	def destroy
		@post = Post.find(params[:id])
		@post.destroy
		redirect_to user_posts_path
	end

  private
  def post_params
  	params.require(:post).permit(:user_id, :title, :body, :category_id)
  end
end
