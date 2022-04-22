class MessagesController < ApplicationController
  before_action :authenticate_user!

  def create
    message = current_user.messages.build(message_params)
    message.save
    if message.errors.any?
      flash[:alert] = message.errors.full_messages.to_sentence
      redirect_to root_path
    else
      # flash[:notice] = "Message Posted Successfully!"
      ActionCable.server.broadcast 'chatroom_channel', message_html: render(partial: 'message', locals: {message: message}), notice: "Message Posted Successfully!"
    end
  end

  private

  def message_params
    params.require(:message).permit(:body)
  end
end