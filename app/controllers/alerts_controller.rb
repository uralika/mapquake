class AlertsController < ApplicationController

def index

        if current_user
                @alerts = current_user.alerts
        else
                redirect_to authentications_url
        end
    end


def new
	@alert = Alert.new
end

def show
	@alert = Alert.find(params[:id])
end

def edit
	@alert = Alert.find(params[:id])
end

def create
	@alert = current_user.alerts.create(params.require(:alert).permit(:name, :street, :state, :zip))
	if @alert.valid?
		redirect_to alerts_url
	else
		render :new
	end
end

def update
	if @alert.update(alert_params)
		redirect_to @alert
	else
		render action: 'edit'
	end
end

 def destroy
        Alert.find(params[:id]).destroy
        redirect_to alerts_url
    end
end
