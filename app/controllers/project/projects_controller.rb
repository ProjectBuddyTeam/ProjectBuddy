class Project::ProjectsController < ApplicationController
  before_action :authenticate_member!, except: [:index, :show]
  before_action :set_project_project, only: [:show, :edit, :update, :destroy]
  after_action :verify_authorized

  respond_to :html, :json
  # GET /projects
  # GET /projects.json
  def index
    @project_projects = Project::Project.all
    authorize @project_projects
    respond_with @project_projects
  end

  # GET projects/1
  # GET projects/1.json
  def show
    authorize @project_project
  end

  # GET /projects/new
  def new
    @project_project = Project::Project.new
    authorize @project_project
    respond_with @project_project
  end

  # GET /projects/1/edit
  def edit
    authorize @project_project
    respond_with @project_project
  end

  # POST /projects
  # POST /projects.json
  def create
    @project_project = Project::Project.new(project_project_params)
    authorize @project_project
    @project_project.member = current_member
    respond_with @project_project
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    authorize @project_project
    @project_project.update(project_project_params)
    respond_with @project_project
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    authorize @project_project
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
      params.require(:project_project).permit(:codename, :mission, :tag_list)
    end
end
