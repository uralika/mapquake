class UsersWorker
	include Sidekiq::Worker
	include Sidetiq::Schedulable

	recurrence { minutely }
	def perform(user_id)
		Notification.daily_quakes(user_id)
end
end