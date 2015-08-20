$(document).ready ->
  $('.chat button').click (event) ->
    event.preventDefault()
    id = $(this).closest('.chat').attr('id')
    $.ajax
      async: false
      type: 'post'
      url: '/messages'
      data:
        authenticity_token: $('#' + id + ' input[name=authenticity_token]').val()
        message:
          text: $('#' + id + ' input').val()
    return
  return
