class WelcomeController < ApplicationController
	before_action :redirect_if_logged_in
	
	def index
		
	end

	private

	def redirect_if_logged_in
  	if current_user.present?
			redirect_to user_path(current_user)
		end
  end
end
