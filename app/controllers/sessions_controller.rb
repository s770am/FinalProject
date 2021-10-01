class SessionsController < ApplicationController
    def new
    end
  
    def create
        team_member = TeamMember.find_by(email: params[:session][:email])
        p(params[:session][:email])

        if team_member && team_member.authenticate(params[:session][:password])  
            session[:team_member] = team_member.id
            redirect_to team_contacts_url(team_member[team_id])   
        else
            
                
                 render :new
        end
    end
  
    def destroy
        session[:user_id] = nil
        redirect_to root_url
    end
end
