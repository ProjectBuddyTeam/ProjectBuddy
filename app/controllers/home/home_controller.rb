class Home::HomeController < ApplicationController
  def show
    @projects = Project::Project.all.active.order(created_at: :desc)
  end
end