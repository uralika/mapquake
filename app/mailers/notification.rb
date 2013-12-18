class Notification < ActionMailer::Base


 default from: "mapquake@gmail.com"

  def new_account(user)
  	mail(:to => user.email,
  		 :subject => "The new account #{user.username} is active.")
  end

  def daily_quakes(user)
  	mail(:to => user.email,
  		:subject => "Daily Selection of Major Quakes for #{user.username}!")
  end
end
