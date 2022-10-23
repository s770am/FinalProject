class NotesController < ApplicationController
  def create
    @note=Note.new(text:params["note"]["text"],pinned:false,contact_id:params["contact_id"])
    if !@note.save
      flash["alert"]="note failed"
    end
    redirect_to team_contact_url(params["team_id"],params["contact_id"])
  end

  def update
    @note=Note.find(params[:id])
    @notes=Note.where(contact_id: params[:contact_id])
    if @note.pinned == false
      @notes.each do |note|
        note.update(pinned: false)
      end
      @note.update(pinned: true)
    elsif @note.pinned == true
      @note.update(pinned: false)
    end
    redirect_to team_contact_url(params["team_id"],params["contact_id"])
  end

  def destroy
    @note=Note.find(params[:id])
    @note.destroy
    redirect_to team_contact_url(params["team_id"],params["contact_id"])
  end
end
