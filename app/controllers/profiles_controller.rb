class ProfilesController < ApplicationController

	def index
	end

	def new
		@profile = Profile.new
	end

	def create
		@profile = Profile.new(profile_params)
		if @profile.save
			flash[:success] = "Register Successfull, Welcome to IdeaHub #{@user.username}"
			redirect_to user_path(@user)
		else

		end
	end

	def edit
	end

	def update
		if @profile.update(profile_params)
			flash[:success] = "Your profile has been updated successfully"
			redirect_to root_path
		else
			render 'edit'
		end
	end

	def show
		#@profile_user = @profile.user
	end

	def destroy
	end

	private

	def profile_params
	end

	def require_same_user
	end

	def require_admin
	end

end