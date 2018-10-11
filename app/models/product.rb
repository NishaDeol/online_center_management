class Product < ApplicationRecord
	validates :name, presence: true

	mount_uploader :image, ImageUploader
	before_save :check_availability

	def check_availability
		if self.description.blank?
			self.description = "this is description"
		end
	end

	# before_validation :check_name
	# before_save :check_price

	# def check_name
	# 	if self.name.blank?
	# 		self.name = "text product"
	# 	end
	# end

	# def check_price
	#	if self.price.present? && self.price.zero?
	# 		self.price = 1
	# 	end
	# end

	def self.class_method
	end

	def instance_method
	end
end
