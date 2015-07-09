class Home::HomeController < ApplicationController
  def show
    @projects = Project::Project
                    .all
                    .active
                    .includes(:member)
                    .order(created_at: :desc)
  end
end