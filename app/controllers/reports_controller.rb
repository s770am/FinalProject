require 'time'
class ReportsController < ApplicationController
    
    def index
        if params['startTime'].present? && params['endTime'].present?
            
            # should change the db but don't have time
            tasks = Task.where("created_at > ? AND created_at < ?", params['startTime'], params['endTime']).select{|task| TeamMember.find(task.team_member_id).team == current_team}
            contacts = Contact.where("created_at > ? AND created_at < ? ", params['startTime'], params['endTime']).where(team_id: current_team.id)
            team_members = TeamMember.where("created_at > ? AND created_at < ? ", params['startTime'], params['endTime']).where(team_id: current_team.id)

            # @tname = tasks.map {|task| task.product}.uniq
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
end
