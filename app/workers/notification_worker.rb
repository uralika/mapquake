class NotificationWorker
	include Sidekiq::Worker
	include Sidetiq::Schedulable
	sidekiq_options queue: "high"

	
	recurrence { hourly.minute_of_hour(0, 15, 30, 45) }
	#recurrence { hourly.minute_of_hour(0, 15, 30, 45) }

	def perform(last_occurrence, current_occurrence)
    Notification.daily_quakes(@user.id).deliver
    end
end

	# def perform(email)
	# 	Notification.daily_quakes(email).deliver
	# end
end



