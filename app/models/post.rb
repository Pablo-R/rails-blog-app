class Post < ApplicationRecord
	belongs_to :user
  has_many :posts_tags
  has_many :tags, through: :posts_tags
	has_many :comments, dependent: :destroy
	
	validates :title, presence: true, length: { minimum: 5 }
	validates :content, presence: true
end