class Post < ApplicationRecord
	belongs_to :user

	mount_uploader :image, ImageUploader
	after_destroy :log_destroy_action

	def log_destroy_action
		puts "post is deleted"
	end
	
end
