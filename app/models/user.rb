class User < ActiveRecord::Base
	require 'bcrypt'

	validates :email, presence:true, 
					  uniqueness: { case_sensitive: false }
	validates :username, presence:true
	validates :password, confirmation: true
	validates :street, presence:true
	validates :state, presence:true
	validates :zip, presence:true

	geocoded_by :street 
	geocoded_by :state 
	geocoded_by :zip
	after_validation :geocode

	has_many :alerts

	def userdef
		@email = email
		@username = username
		@salt = salt
		@hashed_password = hashed_password
		@street = street
		@state = state
		@zip = zip
	end

	attr_accessor :password, :password_confirmation, :email, :username

	before_save :hash_password
	after_save :send_welcome_email

	def authenticate(password)
		self.hashed_password ==
		BCrypt::Engine.hash_secret(password, self.salt)
	end

	private

	

	def hash_password
		if password.present?
			self.salt = BCrypt::Engine.generate_salt
			self.hashed_password =
			BCrypt::Engine.hash_secret(password, self.salt)
			password = password_confirmation = nil
		end
	end	

	def send_welcome_email
		Notification.new_account(self).deliver
	end


end
