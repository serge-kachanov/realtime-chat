setInterval ->
	$.get '/messages',
		(data) -> 
			console.log(data)
			$("#message").text("");

			for message in data
				$("#user .message").append( "<p>" + message.user + ": " + message.text + "</p>")
, 3000
