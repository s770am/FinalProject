class SettingsController < ApplicationController
    
    before_action :require_team
    before_action :require_admin

    def show
    end

    def require_team
        @team=Team.find(params[:team_id])
        unless session[:team_member] && TeamMember.find(session[:team_member]).team.id==@team.id
            flash[:alert]="You do not have access to that page"
            session[:team_member]=nil
            redirect_to root_url
        end
    end

    def require_admin
        unless TeamMember.find(session[:team_member]).admin==true
            flash[:alert]="You do not have access to that page"
            redirect_to team_contacts_url(current_team_member[:team_id])
        end
    end
end
