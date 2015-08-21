source = new EventSource('/messages/events')
source.addEventListener 'message', (e) ->

  message = JSON.parse(e.data)

  console.log(message)
  
  $('#user .messages-streaming').append '<p>'+ message.username + ': ' + message.text + '</p>'

    
