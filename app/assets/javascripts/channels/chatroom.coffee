App.chatroom = App.cable.subscriptions.create "ChatroomChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    if(typeof(data.message_html)!= 'undefined')
      $('#chatbox').append data.message_html
      $('#message_body').val ""
      auto_scroll()
    else if(typeof(data.user_html)!= 'undefined')
      onlineusers_div = $("#online_users")
      el = $("#user_#{data.user_id}")
      if(data.status == 'online' && el == null)
        $("#online_users").append el
      else if(data.status == 'offline' && el != null)
        el.remove()

    # Called when there's incoming data on the websocket for this channel
