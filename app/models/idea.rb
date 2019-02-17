class Idea < ApplicationRecord

	belongs_to :user

	has_many :idea_categories
	has_many :categories, through: :idea_categories

	validates :title, presence: true, length: {minimum: 3, maximum: 50} #ensure is not empty
	validates :description, presence: true, length: {minimum: 3, maximum: 300} 
	validates :user_id, presence: true

end