class TasksController < ApplicationController
    def index
        @team_id=params[:team_id]
        @tasks=Task.where(team_member_id:session[:team_member])
        @first_day=Date::DAYNAMES[Date.today.at_beginning_of_month.wday]
        @month=Date.today.month
        @year=Date.today.year
        @days=Time.days_in_month(@month)
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
        @task.contact_name=@contact.name
        @team_member=@contact.team_member
        @task.team_member_id=@team_member.id
        @task.date=Time.now.strftime("%m-%d-%Y")
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
