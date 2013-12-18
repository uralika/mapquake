class UsersWorker
	include Sidekiq::UsersWorker
	sidekiq_options queue: "high"
	sidekiq_options retry: true

	def perform(user_id)
		user = User.find(user_id)
		
	end
end