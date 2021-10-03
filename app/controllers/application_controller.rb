class ApplicationController < ActionController::Base
    def current_team_member
        @current_team_member = TeamMember.find_by(id: session[:team_member]) if session[:team_member]
    end

    def current_team
        @current_team = Team.find_by(id: current_team_member.team_id) 
    end

    helper_method :current_team_member
    helper_method :current_team
end
