class User::RelationshipsController < ApplicationController

	def create
		current_user.create(params[:id])
		redirect_to request.referer
	end

	def destroy
		current_user.destroy(params[:id])
		redirect_to request.referer
	end

	def follower
		@user = User.find(params[:user_id])
		@users = @user.following_user
	end

	def followed
		@user = User.find(params[:user_id])
		@users = @user.follower_user
	end
end
