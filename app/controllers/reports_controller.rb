class ReportsController < ApplicationController
    
    def index
        @team=Team.find(params[:team_id])
    end
  
    def show
    end
  
    def new
        @team=Team.find(params[:team_id])
        @team_members=@team.team_members
        @contacts=@team.contacts
        @team_member_ids=@team_members.select{|t| t.id}
        @tasks=Task.where(team_member_id:@team_member_ids)
        @report=Report.new
    end
  
    def create
        if !params["report"]["team_member_id"]
            @team_member=TeamMember.where(team_id: params["team_id"])
        else
            @team_member=TeamMember.find(params[:report][:team_member_id])
        end
        if !params["report"]["contact_id"]
            @contact=Contact.where(team_id: params["team_id"])
        else
            @contact=Contact.find(params[:report][:contact_id])
        end
        if !params["report"]["task_id"]
            @task=Task.where(team_id: params["team_id"])
        else
            @task=Task.find(params[:report][:task_id])
        end
    end
  
    def destroy
    end
end
