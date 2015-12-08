class Article < ActiveRecord::Base

	attr_accessible :title, :content

	
	validates :content, presence: true
	validates :title, presence: true

	belongs_to :user
	belongs_to :category
	has_many :article_items
end
