class Notification < ActionMailer::Base


 default from: "mapquake@gmail.com"

  def new_account(user)
  	mail(:to => user.email,
  		 :subject => "#{user.username}, your Mapquake account is now active!")
  end

  def daily_quakes(user_id)
  	user = User.find(user_id)
  	mail(:to => user.email,
  		:subject => "Daily Selection of Major Quakes for #{user.username}!")
  end
end
