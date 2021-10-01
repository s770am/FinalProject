class TeamMembersController < ApplicationController
    def index
        @team=Team.find(params["team_id"])
        @members=@team.team_members
        @message=Message.new
    end
    
    def new
        @team_member=TeamMember.new
    end
  
    def create
        @team_member=TeamMember.new(create_params)
        if params["team_member"]["admin"]=="true"
            done=false
            while !done
                code=(0...8).map { (65 + rand(26)).chr }.join
                teams=Team.all
                try=teams.select {|team| team.team_code==code}
                if try==[]
                    done=true
                end
            end
            team=Team.create(name: @team_member.name,team_code:code )
            @team_member.team_id=team.id
        elsif params["team_member"]["admin"]=="false"
            all=Team.all
            team=all.select{|team| team.team_code==params["team_member"]["team_id"]}
            if team!=[]
                @team_member.team_id=team[0].id
            end
        end
        if @team_member.save
            session[:team_member] = @team_member.id
            redirect_to team_team_members_url(@team_member.team)
        else
            render :new
        end
    end

    private
    def create_params
        params.require(:team_member).permit(:name,:email,:password,:password_confirmation,:admin)
    end
end
