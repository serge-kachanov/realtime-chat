$(document).ready ->
  dispatcher = new WebSocketRails('localhost:3000/websocket')
  channel = dispatcher.subscribe('messages')
  channel.bind 'new', (message) ->
    $('#user .messages-websockets').append '<p>'+ message.user + ': ' + message.text + '</p>'
    return

