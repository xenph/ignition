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
