$(document).ready ->
  $('.chat button').click (event) ->
    event.preventDefault()
    input = $('#user input')
    $.ajax
      async: false
      type: 'post'
      url: '/messages'
      data:
        authenticity_token: $('user input[name=authenticity_token]').val()
        message:
          text: input.val()
    input.val('')
    return
  return
