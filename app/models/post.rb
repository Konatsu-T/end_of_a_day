class Post < ApplicationRecord
	belongs_to :user, optional: true
	belongs_to :category
	has_many :post_comments
	has_many :favorites
	def favorited_by?(user)
		favorites.where(user_id: user.id).exists?
	end

	validates :title, presence: true
	validates :body, presence: true, length: {maximum: 200}

	def Post.search(search, how_search)
      # 部分一致
      if how_search == "1"
		Post.where(['title LIKE ?',"%#{search}%"])
      # 後方一致
      elsif how_search == "2"
		Post.where(['title LIKE ?',"%#{search}"])
      # 前方一致
      elsif how_search == "3"
		Post.where(['title LIKE ?',"#{search}%"])
      # 完全一致
      elsif how_search == "4"
		Post.where(['title LIKE ?',"#{search}"])
      else
		Post.all
      end
	end
end
