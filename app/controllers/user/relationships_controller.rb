class User::RelationshipsController < ApplicationController

	def create
		current_user.create(params[:id])
		redirect_to request.referer
	end

	def destroy
		current_user.unfollow(params[:id])
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

	private
	def relationship_params
		params.require(:relationship).permit(:follower_id, :followed_id)
	end
end
