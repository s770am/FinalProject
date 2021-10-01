class TeamMembersController < ApplicationController
    def index
        @team=Team.find(params["team_id"])
        @members=@team.team_members
        @message=Message.new
    end
    
    def new
    end
  
    def create
    end
end
