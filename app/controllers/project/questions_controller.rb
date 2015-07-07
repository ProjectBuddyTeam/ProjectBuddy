class Project::QuestionsController < ApplicationController
  before_action :authenticate_member!, except: [:index]
  before_action :set_project_question, only: [:edit, :destroy, :update]
  before_action :set_project_project
  after_action :verify_authorized

  respond_to :html

  def new
    @project_question = Project::Question.new(project: @project)
    authorize @project_question
    respond_with @project_question
  end

  def create
    @project_question = Project::Question.new(project_question_params)
    @project_question.member = current_member
    @project_question.project = @project
    authorize @project_question
    @project_question.save
    respond_with @project_question, location: project_project_path(@project)
  end

  def edit
    authorize @project_question
    respond_with @project_question
  end

  def update
    authorize @project_question
    @project_question.update(project_question_params)
    respond_with @project_question, location: project_project_path(@project)
  end

  private

    def set_project_question
      @project_question = Project::Question.find(params[:id])
    end

    def set_project_project
      @project = Project::Project.friendly.find(params[:project_id])
    end

    def project_question_params
      params.require(:project_question).permit(:question, :question_body)
    end
end