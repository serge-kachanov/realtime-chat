$(document).ready ->
  $('.chat button').click (event) ->
    event.preventDefault()
    $.ajax
      async: false
      type: 'post'
      url: '/messages'
      data:
        authenticity_token: $('#user input[name=authenticity_token]').val()
        message:
          text: $('#user input').val()
    return
  return
