module ProjectsHelper

  def toggle_pledge_button(project)
    
    if project.goal_type
      hours_active = project.goal_type == 'hours' ? ' active' : ''
      votes_active = project.goal_type == 'votes' ? ' active' : ''
    else
      hours_active = ''
      votes_active = ' active'
    end
    
    raw('<div class="btn-group" data-toggle="buttons-radio">
			<button id="pledge-hours" class="btn' + hours_active + '" type="button">Hours</button>
			<button id="pledge-votes" class="btn' + votes_active + '" type="button">Votes</button>
		</div>')
  end

end
