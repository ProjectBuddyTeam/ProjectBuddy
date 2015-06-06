class Profile::MyProjectsController < ApplicationController
  before_action :authenticate_member!

  respond_to? :html

  def index
    @projects = current_member.projects
  end
end