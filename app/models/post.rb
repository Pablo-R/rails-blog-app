class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  acts_as_taggable # Alias for acts_as_taggable_on :tags

  validates :title, presence: true, length: { minimum: 5 }
  validates :content, presence: true
  validates :tag_list, presence: true
end