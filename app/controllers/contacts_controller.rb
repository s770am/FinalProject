class ContactsController < ApplicationController
    def index
    end
  
    def show
        @contact=Contact.find(params[:id])
        @notes=@contact.notes.order(:created_at)
        @note=Note.new
    end
  
    def new
    end
  
    def create
    end
  
    def edit
    end
  
    def update
    end
  
    def destroy
        @contact=Contact.find(params[:id])
        @contact.destroy
        redirect_to team_team_members_url(params["team_id"])
    end
end
