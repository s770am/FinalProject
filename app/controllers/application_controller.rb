class ApplicationController < ActionController::Base
    def current_team_member
        p(session[:team_member])
        @current_team_member = TeamMember.find_by(id: session[:team_member]) if session[:team_member]
    end

    helper_method :current_team_member
end
