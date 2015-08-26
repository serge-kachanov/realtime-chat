setInterval ->
	$.get '/messages',
		(data) -> 
			console.log(data)
			$("#messages-shortpoll").text("");

			for message in data
				$("#user .messages-shortpoll").append( "<p>" + "[" + message.time + "] "  + message.user + ": " + message.text + "</p>")
, 3000
