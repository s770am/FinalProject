class TasksController < ApplicationController
    def index
        if params[:commit]
            calculate(params[:commit])
        else
            session[:date]=Date.today
        end
        @date=session[:date]
        @team_id=params[:team_id]
        @tasks=Task.where(team_member_id:session[:team_member])
        @first_day=Date::DAYNAMES[@date.at_beginning_of_month.wday]
        @month=@date.month
        @year=@date.year
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

    def calculate(direction)
        if direction=="previous"
            session[:date]=Date.parse(session[:date]) - 1.month
        elsif direction=="next"
            session[:date]=Date.parse(session[:date]) + 1.month
        end
    end
end
