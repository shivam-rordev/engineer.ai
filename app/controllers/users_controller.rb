class UsersController < ApplicationController
	def index
		@users = User.all
	end

	def create
		@user = User.new(params)
	end

	def show
		@user = User.find(params[:id])
	end
end
