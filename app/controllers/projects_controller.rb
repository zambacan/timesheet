class ProjectsController < ApplicationController
  def show
    @project=Project.find(params[:id])
  end
  def index
    @projects = Project.all
  end
  def new
    @project = Project.new
  end

  def create
    @project = Project.new(params[:project])
    # send the appropriate message and redirect to
    # stay where i am
    respond_to do |format|
      if @project.save
        # flash[:success] = "Project created"
        format.html { redirect_to @project, notice: 'Project was successfully created.' }
        format.json { render json: @project, status: :created, location: @project }
      else
        format.html { render action: "new"}
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end
end

