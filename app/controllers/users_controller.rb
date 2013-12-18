class UsersController < ApplicationController
	def index
		@users = User.all
		@hash = Gmaps4rails.build_markers(@users) do |user, marker|
			marker.lat user.latitude
			marker.lng user.longitude
		end
	end

	def new
		@user = User.new
	end

	def show
		@users = User.find(params[:id])
	end

	def create
		@user = User.create(params[:user].permit(:email, :password, :password_confirmation, :username, :street, :state, :zip))
		if @user.save
			session[:user_id] = @user.id
			redirect_to root_url
			Notification.new_account(current_user).deliver
		else
			redirect_to action:"new"
		end
	end

	def destroy
		User.find(params[:id]).destroy
		redirect_to root_url
	end

	UsersWorker.perform_async(@user.id)
end