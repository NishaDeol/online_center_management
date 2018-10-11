class Book < ApplicationRecord
	belongs_to :user
	validates :name, presence: true
  validates :price, numericality: true
  before_save :check_title

 # def check_title
 #	if self.title.blank?
 #		self.name = "title"
 #	end
 #end

	
end
