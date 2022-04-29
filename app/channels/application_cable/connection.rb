module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def connect
      self.current_user = find_verified_user
      html = ApplicationController.render(partial: 'users/shared/online_user', locals: {user: current_user, status: 'online'})
      ActionCable.server.broadcast "chatroom_channel", user_html: html, user_id: current_user.id
    end

    protected

    def find_verified_user
      if current_user = env['warden'].user
        current_user
      else
        reject_unauthorized_connection
      end
    end

  end
end
