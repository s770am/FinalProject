class TasksController < ApplicationController
    def index
    end
  
    def show
    end
  
    def new
        @contact=Contact.find(params[:contact_id])
        @task=Task.new
    end
  
    def create
        @task=Task.new(task_params)
        @contact=Contact.find(params[:contact_id])
        @task.contact_id=@contact.id
        @team_member=@contact.team_member
        @task.team_member_id=@team_member.id
        if @task.save
            redirect_to team_contact_url(@team_member.team,@contact)
        else
            render :new
        end
    end
  
    def edit
    end
  
    def update
    end
  
    def destroy
    end

    private
    def task_params
        params.require(:task).permit(:status,:product,:total_hours,:progress,:goal,:note)
    end
end
