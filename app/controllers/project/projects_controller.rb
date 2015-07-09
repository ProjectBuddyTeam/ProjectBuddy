class Project::ProjectsController < ApplicationController
  before_action :authenticate_member!, except: [:index, :show]
  before_action :set_project_project, only: [:show, :edit, :update, :destroy]
  after_action :verify_authorized

  respond_to :html

  # GET /projects
  def index
    @filter_tags = params[:tags]
    @project_projects = Project::Project.tagged_with(@filter_tags).active
    authorize @project_projects
    respond_with @project_projects
  end

  # GET projects/1
  def show
    authorize @project_project
    impressionist @project_project, nil, unique: [:session_hash]
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
    respond_with @project_project, location: profile_my_projects_path
  end

  # POST /projects
  def create
    @project_project = Project::Project.new(project_project_params)
    authorize @project_project
    @project_project.member = current_member
    @project_project.save
    respond_with @project_project
  end

  # PATCH/PUT /projects/1
  def update
    authorize @project_project
    @project_project.update(project_project_params)
    respond_with @project_project
  end

  # DELETE /projects/1
  def destroy
    authorize @project_project
    @project_project.archived!
    respond_with @project_project, location: profile_my_projects_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project_project
      @project_project = Project::Project.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_project_params
      params.require(:project_project).permit(:codename, :mission, :tag_list, :details)
    end
end
