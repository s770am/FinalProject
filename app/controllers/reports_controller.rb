require 'time'

class ReportsController < ApplicationController
    
    before_action :require_team
    before_action :require_admin
    
    def index
        if params['startTime'].present? && params['endTime'].present?
            
            # should change the db but don't have time
            tasks = Task.where("created_at > ? AND created_at < ?", params['startTime'], params['endTime']).where(team_id: current_team.id)
            contacts = Contact.where("created_at > ? AND created_at < ? ", params['startTime'], params['endTime']).where(team_id: current_team.id)
            team_members = TeamMember.where("created_at > ? AND created_at < ? ", params['startTime'], params['endTime']).where(team_id: current_team.id)

            @tasksHash = tasks.map {|task| task.product if task.status == "complete"}.tally
            @ContactsHash = tasks.map {|task| task.product}.tally
            @teamMembersHash = team_members.map { |member|
                mTotal_hours = 0
                member.contacts.each{ |contact|
                    contact.tasks.each{|task|
                        mTotal_hours += task.total_hours 
                    }
                }
                {member.name => mTotal_hours}
            }.reduce Hash.new, :merge
            

            render json: {
                "tasksHash": @tasksHash,
                "ContactsHash": @ContactsHash,
                "teamMembersHash": @teamMembersHash

            }


        end
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
