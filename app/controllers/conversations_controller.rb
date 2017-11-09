class ConversationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
    @conversations = Conversation.all
    @repair = Repair.find(params[:repair_id])
  end

  def create
    @repair = Repair.find(params[:repair_id])

    # Sender and receiver should not be the same
    if params[:sender_id]!=params[:recipient_id]
      if Conversation.between(params[:sender_id],params[:recipient_id],params[:repair_id]).present?
        @conversation = Conversation.between(params[:sender_id],
        params[:recipient_id]).first
      else
        @conversation = Conversation.create!(conversation_params)
      end
    redirect_to repair_conversation_messages_path(@repair, @conversation)
    else
      respond_to do |format|
        format.html { redirect_to repair_path(@repair), notice: 'You cannot send a message to yourself.' }
        format.json { head :no_content }
      end
  end
end

  private
  def conversation_params
    params.permit(:sender_id, :recipient_id, :repair_id)
  end
end