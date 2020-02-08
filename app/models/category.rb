class Category < ApplicationRecord
	has_many :posts, dependent: :destroy
	validates :category_name, :category_status, presence: true
	enum category_status: { 掲載中: 0, 非掲載: 1 }
end
