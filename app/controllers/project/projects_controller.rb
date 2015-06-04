class Project::ProjectsController < ApplicationController
  before_action :set_project_project, only: [:show, :edit, :update, :destroy]

  respond_to :html, :json
  # GET /project/projects
  # GET /project/projects.json
  def index
    @project_projects = Project::Project.all
    respond_with @project_projects
  end

  # GET /project/projects/1
  # GET /project/projects/1.json
  def show
  end

  # GET /project/projects/new
  def new
    @project_project = Project::Project.new
    respond_with @project_project
  end

  # GET /project/projects/1/edit
  def edit
  end

  # POST /project/projects
  # POST /project/projects.json
  def create
    @project_project = Project::Project.new(project_project_params)
    respond_with @project_project
  end

  # PATCH/PUT /project/projects/1
  # PATCH/PUT /project/projects/1.json
  def update
    respond_with @project_project
  end

  # DELETE /project/projects/1
  # DELETE /project/projects/1.json
  def destroy
    @project_project.destroy
    respond_with @project_project
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project_project
      @project_project = Project::Project.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_project_params
      params.require(:project_project).permit(:codename, :mission, :member_id)
    end
end
