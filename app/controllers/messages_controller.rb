class MessagesController < ApplicationController
  def index
  end

  def create
    msg=params["message"]
    @message=Message.new(subject: msg["subject"], text: msg["text"], sender: params["team_member_id"], team_id: params["team_id"], team_member_id: TeamMember.find_by(name: msg["team_member_id"]).id)
    if @message.save
      flash[:notice]="message sent"
    else
      flash[:alert]="message failed to send"
    end
    redirect_to team_team_members_url(params["team_id"])
  end

  def destroy
  end
end
