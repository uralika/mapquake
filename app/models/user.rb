class User < ActiveRecord::Base
	require 'bcrypt'

	has_many :alerts
end
