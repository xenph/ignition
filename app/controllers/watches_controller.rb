class WatchesController < ApplicationController
  def create
    @watch = Watch.new()
    @watch.project_id = params[:project_id]
    @watch.user = current_user
    
    existing_watch = Watch.where("project_id = ? AND user_id = ?", @watch.project.id, @watch.user.id).first
    if existing_watch != nil
      existing_watch.destroy
      flash[:notice] = "You are no longer watching #{@watch.project.title}."
      redirect_to(@watch.project)
    else 
      if @watch.save
        Event::record @watch.project, current_user, "started watching"
        flash[:notice] = "You are now watching #{@watch.project.title}."
        redirect_to(@watch.project)
      else
        flash[:notice] = "Error creating watch: #{@watch.errors}"
        redirect_to(@watch.project)
      end
    end
  end
end