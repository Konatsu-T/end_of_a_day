class User::CategoriesController < ApplicationController
  def show
  	@categories = Category.where(category_status: :掲載中)
  	@category = Category.find(params[:id])
  	@category.posts
  end

  def category_params
    params.require(:category).permit(:category_name, :category_status)
  end
end
