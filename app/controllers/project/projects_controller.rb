class Project::ProjectsController < ApplicationController
  before_action :set_project_project, only: [:show, :edit, :update, :destroy]

  # GET /project/projects
  # GET /project/projects.json
  def index
    @project_projects = Project::Project.all
  end

  # GET /project/projects/1
  # GET /project/projects/1.json
  def show
  end

  # GET /project/projects/new
  def new
    @project_project = Project::Project.new
  end

  # GET /project/projects/1/edit
  def edit
  end

  # POST /project/projects
  # POST /project/projects.json
  def create
    @project_project = Project::Project.new(project_project_params)

    respond_to do |format|
      if @project_project.save
        format.html { redirect_to @project_project, notice: 'Project was successfully created.' }
        format.json { render :show, status: :created, location: @project_project }
      else
        format.html { render :new }
        format.json { render json: @project_project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /project/projects/1
  # PATCH/PUT /project/projects/1.json
  def update
    respond_to do |format|
      if @project_project.update(project_project_params)
        format.html { redirect_to @project_project, notice: 'Project was successfully updated.' }
        format.json { render :show, status: :ok, location: @project_project }
      else
        format.html { render :edit }
        format.json { render json: @project_project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /project/projects/1
  # DELETE /project/projects/1.json
  def destroy
    @project_project.destroy
    respond_to do |format|
      format.html { redirect_to project_projects_url, notice: 'Project was successfully destroyed.' }
      format.json { head :no_content }
    end
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
