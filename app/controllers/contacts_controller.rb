class ContactsController < ApplicationController
    def index
        @contacts = Contact.filtered(query_params)

        if current_team_member.admin
            @contacts = @contacts.where(team_id: current_team_member.team_id)
        else
            @contacts= @contacts.where(team_id: current_team_member.team_id, team_member_id: current_team_member.id)
        end
        
    end
  
    def show
        @contact=Contact.find(params[:id])
        @notes=@contact.notes.order(:created_at)
        @note=Note.new
    end
  
    def new
        @team = current_team
        @contact = Contact.new(name: "")
    end
  
    def create
        @team = current_team
        @contact = Contact.new(contact_params)

        @contact.update(team_id: @team.id, team_member_id: current_team_member.id)

        if @contact.save 
            redirect_to team_contacts_url(current_team_member[:team_id])
        else
            flash[:error] = "You Must Enter A Name For The Contact"
            render :new
        end
    end
  
    def edit
        @team = current_team
        @contact = Contact.find(params[:id])
    end
  
    def update
        @contact = Contact.find(params[:id])

       if @contact.update(contact_params)
           redirect_to team_contacts_path(current_team_member[:team_id])
       else
           render :edit
       end 
    end
  
    def destroy
        @contact=Contact.find(params[:id])
        @contact.destroy
        redirect_to team_contacts_url(current_team_member[:team_id])
    end

    private
def query_params
  query_params = params[:query]
  query_params ? query_params.permit(:sName) : {}
end

def contact_params
    params.require(:contact).permit(:email, :name, :number, :birthdate, :address )
end

end
