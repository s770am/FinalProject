class ContactsController < ApplicationController
    def index
        # if current_team_member.admin
        #     @contacts = Contact.where(team_id: current_team_member.team_id)
        # else
        #     @contacts = Contact.where(team_id: current_team_member.team_id, team_member_id: current_team_member.id)
        # end

        @contacts = Contact.filtered(query_params)
        
        
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

    private
def query_params
  query_params = params[:query]
  query_params ? query_params.permit(:sName) : {}
end

end
