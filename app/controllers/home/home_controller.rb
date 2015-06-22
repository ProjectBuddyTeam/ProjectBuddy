class Home::HomeController < ApplicationController
  def show
    @projects = Project::Project.all.active
  end
end