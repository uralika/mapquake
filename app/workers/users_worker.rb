class UsersWorker
	include Sidekiq::Worker
	include Sidetiq::Schedulable

	recurrence { hourly.minute_of_hour(0, 15, 30, 45) }

	def perform(user_id)
		Notification.daily_quakes(user_id)
	end
end