source = new EventSource('/messages/events')
source.addEventListener 'message', (e) ->

  message = JSON.parse(e.data)

  console.log(message)
  
  $('#user .msg').append '<p>'+ message.username + ': ' + message.text + '</p>'

    
