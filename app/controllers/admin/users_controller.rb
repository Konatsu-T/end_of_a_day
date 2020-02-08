class Admin::UsersController < ApplicationController

	def index
		@users = User.with_deleted
	end

	def show
		@user = User.with_deleted.find(params[:id])
	end

	def edit
		@user = User.with_deleted.find(params[:id])
	end

	def update
		@user = User.with_deleted.find(params[:id])
		@user.update(user_params)
		case params[:num]
		when "0"
		 # 有効会員にする（論理削除を取り消す）
		 @user.restore
		 redirect_to admin_user_path(@user)
		# 退会済みにする（論理削除）
		when "1"
		 @user.delete
		 redirect_to admin_user_path(@user)
		else
		 render :edit
		end
	end

	private
	def user_params
		params.require(:user).permit(:name, :email, :introduction, :profile_image, :deleted_at, :num)
	end
end
