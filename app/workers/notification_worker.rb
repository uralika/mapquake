class NotificationWorker
	include Sidekiq::Worker
	include Sidetiq::Schedulable
	sidekiq_options queue: "high"

	
	recurrence { hourly.minute_of_hour(0, 15, 30, 45) }
	#recurrence { hourly.minute_of_hour(0, 15, 30, 45) }

	def perform(last_occurrence, current_occurrence)
    users = Users.all
    users.each do |user|
    Notification.send(daily_quakes, user).deliver
    end
end

	# def perform(email)
	# 	Notification.daily_quakes(email).deliver
	# end
end

NotificationWorker.perform_async(@user)

