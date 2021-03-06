class Article < ApplicationRecord

	belongs_to :user, class_name: 'User', foreign_key: :author_id

	validates :content, presence: true
end
