class PostComment < ApplicationRecord
	belongs_to :post
	belongs_to :user
	varidates :comment, presence: true
end
