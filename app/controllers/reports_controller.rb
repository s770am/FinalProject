require 'time'
class ReportsController < ApplicationController
    
    def index
        puts "-------------#{params['endTime']}"
        if params['startTime'].present?
            
            tasks = Task.where("created_at > ? AND created_at < ?", params['startTime'], params['endTime'])
            contacts = Contact.where("created_at > ? AND created_at < ?", params['startTime'], params['endTime'])
            team_members = TeamMember.where("created_at > ? AND created_at < ?", params['startTime'], params['endTime'])

            # @tname = tasks.map {|task| task.product}.uniq
            @ncomplete = tasks.map {|task| task.product if task.status == "complete"}.tally
            @nContacts = tasks.map {|task| task.product}.tally
            @nHourTask = team_members.map { |member|
                mTotal_hours = 0
                member.contacts.each{ |contact|
                    contact.tasks.each{|task|
                        mTotal_hours += task.total_hours 
                    }
                }
                {name: team_members.name, total_hours: mTotal_hours}
            }
            

            render json: {
                "team_members": @nHourTask,
                "ncomplete": @ncomplete,
                "nContacts": @nContacts

            }


        end
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
