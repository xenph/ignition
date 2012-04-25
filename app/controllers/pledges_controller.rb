class PledgesController < ApplicationController
  def create
    @pledge = Pledge.new(params[:pledge])
    @pledge.user = current_user
    existing_pledge = Pledge.where("project_id = ? AND user_id = ?", @pledge.project.id, @pledge.user.id).first
    if existing_pledge != nil
      existing_pledge.amount = @pledge.amount
      @pledge = existing_pledge
    end
    if @pledge.project.goal_type == 'votes'
      @pledge.amount = existing_pledge != nil ? 0 : 1
    end
    if @pledge.amount <= 0
      Event::record @pledge.project, current_user, 'removed their pledge.'
      @pledge.destroy
      flash[:notice] = 'Pledge was successfully removed.'
      redirect_to(@pledge.project)
    else
      if @pledge.save
        Event::record @pledge.project, current_user, "pledged #{@pledge.amount} #{@pledge.project.goal_type} to this project."
        flash[:notice] = "You have successfully pledged #{@pledge.amount} #{@pledge.project.goal_type} to the #{@pledge.project.title} cause."
        redirect_to(@pledge.project)
      else
        flash[:notice] = "Error creating pledge: #{@pledge.errors}"
        redirect_to(@pledge.project)
      end
    end
  end
end