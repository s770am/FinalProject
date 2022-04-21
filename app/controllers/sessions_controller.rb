class SessionsController < ApplicationController
    def new
    end
  
    def create
        team_member = TeamMember.find_by(email: params[:session][:email])

        if team_member && team_member.authenticate(params[:session][:password])  
            session[:team_member] = team_member.id
            redirect_to team_contacts_url(team_member[:team_id])   
        else
            
            flash[:error] = "Invalid Email or Password"

            render :new
        end
    end
  
    def destroy
        session[:user_id] = nil
        redirect_to root_url
    end
end
