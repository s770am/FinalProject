class SessionsController < ApplicationController
    def new
    end
  
    def create
        team_member = TeamMember.find_by(email: params[:session][:email])

        if team_member && team_member.authenticate(params[:session][:password])  
            session[:team_member] = team_member.id
            redirect_to team_contacts_url(team_member[:team_id])   
        else
            # set up proper error message

            
            if params[:session][:email] == "" && params[:session][:password] == ""
                flash[:error] = "You Need To Enter A Valid Email And A Valid Password"
            elsif params[:session][:email] == ""
                flash[:error] = "You Need To Enter A Email"
            elsif params[:session][:password] == ""
                flash[:error] = "You Need To Enter A Valid Password"
            else
                flash[:error] = "Invalid Email or Password"
            end

            render :new
        end
    end
  
    def destroy
        session[:user_id] = nil
        redirect_to root_url
    end
end
