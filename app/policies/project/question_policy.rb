class Project::QuestionPolicy < ApplicationPolicy
  attr_reader :member, :question, :project

  def initialize(member, question)
    @member = member
    @project = question.project
    @question = question
  end

  def create?
    member != project.member
  end

  def update?
    member == question.member
  end

  def update_answer?
    member == project.member
  end

  def edit_answer?
    update_answer?
  end

  class Scope < Scope
    def resolve
      scope
    end
  end
end
