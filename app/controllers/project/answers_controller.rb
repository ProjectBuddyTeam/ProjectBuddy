class Project::AnswersController < ApplicationController
  before_action :authenticate_member!
  before_action :set_question_and_project
  after_action :verify_authorized

  def edit
    authorize @project_question, :edit_answer?
    respond_with @project_question, location: edit_project_question_answer_path(@project, @project_question)
  end

  def update
    authorize @project_question, :update_answer?
    @project_question.update(question_answer_params)
    respond_with @project_question, location: project_project_path(@project)
  end

  private
    def set_question_and_project
      @project_question = Project::Question.find(params[:question_id])
      @project = @project_question.project
    end

    def question_answer_params
      params.require(:project_question).permit(:answer)
    end
end