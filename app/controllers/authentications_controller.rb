class AuthenticationsController < ApplicationController
	before_action :authenticate_user, only: [:destroy]

	def new
		# Is the user already logged in?
		if current_user # Logged in, can't create again!
			redirect_to root_url
		else
			@user = User.new
		end
	end

	def create 
		if user = User.find_by(email: params[:user][:email])
			# authenticate user
		if user.authenticate(params[:user][:password]) && if session[:user_id] = user.id
		   redirect_to root_url
		else
			flash.now.alert = "Unable to sign you in. Please try again."
			redirect_to authentications_url
		end
	   end
	  end
	end

	def destroy
		session[:user_id] = nil
		redirect_to root_url,
		notice: "You signed out."
	end
end