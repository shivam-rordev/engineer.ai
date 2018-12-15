module SecretCodesHelper

	# This method should return list of all available codes
	def available_codes
		SecretCode.where("user_id IS ?", nil).pluck(:code)
	end
end
