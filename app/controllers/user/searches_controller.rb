class User::SearchesController < ApplicationController
	def search
		@how_search = params[:choice]
		@posts = Post.search(params[:search], @how_search)
	end
end
