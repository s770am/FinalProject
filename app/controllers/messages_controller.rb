class MessagesController < ApplicationController
  def index
    @member=TeamMember.find(params["team_member_id"])
    @messages=@member.messages
  end

  def create
    msg=params["message"]
    @message=Message.new(subject: msg["subject"], text: msg["text"], sender: TeamMember.find(session[:team_member]).name, team_id: params["team_id"], team_member_id: TeamMember.find_by(name: msg["team_member_id"]).id,read:false)
    if @message.save
      flash[:notice]="message sent"
    else
      flash[:alert]="message failed to send"
    end
    redirect_to team_team_members_url(params["team_id"])
  end

  def update
    @message=Message.find(params[:id])
    @message.update(read:true)
  end

  def destroy
    @message=Message.find(params[:id])
    @message.destroy
    redirect_to team_team_member_messages_url(params["team_id"],params["team_member_id"])
  end

end
