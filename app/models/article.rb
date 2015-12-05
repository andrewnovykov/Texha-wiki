class Article < ActiveRecord::Base

	attr_accessible :title, :content

	
	validates :content, presence: true
	validates :title, presence: true

	belongs_to :user
	belongs_to :category
end
