class ApplicationController < ActionController::Base
    def current_team_member
        @current_team_member = Team_member.find(session[:user_id]) if session[:user_id]
    end
end
