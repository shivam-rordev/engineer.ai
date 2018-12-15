class SecretCode < ApplicationRecord
	resourcify
  attr_accessor :number
	belongs_to :user, optional: true
	

	# This method should genrate a secure secret code
	def generate_secret_code
    SecureRandom.hex(4)
  end

end
