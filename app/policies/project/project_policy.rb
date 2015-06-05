class Project::ProjectPolicy < ApplicationPolicy
  attr_reader :member, :project

  def initialize(member, project)
    @member = member
    @project = project
  end

  def index?
    true
  end

  def show?
    scope.where(id: project.id).exists?
  end

  def create?
    true
  end

  def update?
    member == project.member
  end

  def destroy?
    member == project.member
  end

  def scope
    Pundit.policy_scope!(member, project.class)
  end

end