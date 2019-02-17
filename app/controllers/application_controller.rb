class ApplicationController < ActionController::Base
protect_from_forgery with: :exception #protect from CSRF vulnerability


	helper_method :current_user, :logged_in?
	def current_user
		@current_user  ||= User.find(session[:user_id]) if session[:user_id]   #return the user if there is a session and find based on user id

	end

	def logged_in?
		!!current_user
	end

	def require_user
		if !logged_in?
			flash[:danger] = "You must be logged in to perform that action"
			redirect_to root_path
		end
	end
end

