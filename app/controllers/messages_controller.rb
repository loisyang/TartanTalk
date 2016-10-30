#Messages are a separate entity controlled here
class MessagesController < ApplicationController

  def create
    message = Message.new(message_params)
    message.user = current_user
    if message.save
      if message.user.username != nil or message.user.anonymous = false #FIX THIS BY SETTING DEFAULT TO FALSE RIGHT NOW DEFAULT IS TRUE.
      ActionCable.server.broadcast 'messages',
        message: message.content,
        user: message.user.username
      head :ok

      else 
      ActionCable.server.broadcast 'messages',
        message: message.content,
        user: message.user.name
      head :ok
      end

    end
  end

  private

    def message_params
      params.require(:message).permit(:content, :chatroom_id)
    end
end
