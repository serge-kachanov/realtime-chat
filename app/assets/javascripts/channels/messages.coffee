App.messages = App.cable.subscriptions.create 'MessagesChannel',
  received: (data) ->
    $('#user .m').append @renderMessage(data)
  renderMessage: (data) ->
    "<p>#{data.user}: #{data.text}</p>"
