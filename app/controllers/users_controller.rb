class UsersController < ApplicationController
	def new
		@user = User.new
	end

	def create
		@user = User.create(params[:user])
		respond_to do |format|
			format.html { redirect_to(users_path) }
			format.js { render :create }


	end

end