# Binds a toggle between vote/hour based pledges to the projects form.
jQuery ($) ->
	selectHours = ->
		$('input#project_goal_type').attr 'value', 'hours'
		$('#goal-note').text 'hours'
	
	selectVotes = ->
		$('input#project_goal_type').attr 'value', 'votes'
		$('#goal-note').text 'votes'

	$('#pledge-hours').click ->
		selectHours()
	$('#pledge-votes').click ->
		selectVotes()
		
	$('.add-comment button').click ->
		$(this).next().toggle()
		
	if window.location.hash
		$('.nav-pills li:last a').tab('show')
	else
		$('.nav-pills li:first a').tab('show')
