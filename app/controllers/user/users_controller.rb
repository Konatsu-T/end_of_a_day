class User::UsersController < ApplicationController
	before_action :authenticate_user!

	# コントローラのフォームタグごとにメソッドやアクション固有の認証トークンが追加されます
	self.per_form_csrf_tokens = true

	def show
		@user = User.find(params[:id])
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		if @user.update(user_params)
			redirect_to user_user_path(@user), notice: "アカウント情報を変更しました！"
		else
			render :edit
		end
	end

	def destroy
	end

	def destroy_withdraw
		@user = User.find(params[:id])
		if @user.delete
		redirect_to top_path
	    else
	    	render :show
	    end
	end

	def withdraw
	end

 private
 def user_params
 params.require(:user).permit(:id, :name, :email, :introduction, :profile_image)
 end

end
