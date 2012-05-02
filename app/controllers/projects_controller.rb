class ProjectsController < ApplicationController
  before_filter :authenticate_user!
  
  # GET /projects
  # GET /projects.json
  def index
    if params[:search] == nil
      @projects = Project.all
    else
      @projects = Project.where('title like ? or slug like ?', "%#{params[:search]}%", "%#{params[:search]}%")
    end
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @projects }
    end
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
    @project = Project.find(params[:id])
    @pledge = Pledge.new( :project => @project )
    @watch = Watch.new( :project => @project )

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @project }
    end
  end

  # GET /projects/new
  # GET /projects/new.json
  def new
    @project = Project.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @project }
    end
  end

  # GET /projects/1/edit
  def edit
    @project = Project.find(params[:id])
    if @project.user != current_user
      flash[:alert] = 'You can only edit projects that you created.'
      redirect_to(@project)
    end
    Event::record @project, current_user, 'edited this project.'
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = Project.new(params[:project])
    @project.user = current_user

    respond_to do |format|
      if @project.save
        Event::record @project, current_user, 'created'
        format.html { redirect_to @project, notice: 'Project was successfully created.' }
        format.json { render json: @project, status: :created, location: @project }
      else
        format.html { render action: "new" }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /projects/1
  # PUT /projects/1.json
  def update
    @project = Project.find(params[:id])

    respond_to do |format|
      if @project.user == current_user && @project.update_attributes(params[:project])
        Event::record @project, current_user, 'edited'
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project = Project.find(params[:id])
    
    if @project.user != current_user
      flash[:alert] = 'You can only delete projects that you created.'
      redirect_to(@project)
    else
      @project.destroy

      respond_to do |format|
        format.html { redirect_to projects_url }
        format.json { head :no_content }
      end
    end
  end
end
