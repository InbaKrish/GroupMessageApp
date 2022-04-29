class ChatroomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "chatroom_channel"
    ActionCable.server.pubsub.redis_connection_for_subscriptions.sadd 'online', current_user.id

    html = ApplicationController.render(partial: 'users/shared/online_user', locals: {user: current_user, status: 'online'})
    ActionCable.server.broadcast "chatroom_channel", user_html: html, user_id: current_user.id
  end

  def unsubscribed
    ActionCable.server.pubsub.redis_connection_for_subscriptions.srem 'online', current_user.id
    # Any cleanup needed when channel is unsubscribed
  end
end
