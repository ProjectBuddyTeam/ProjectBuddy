class Project::TagsController < ApplicationController
  def index
    @tags = Project::Project.tag_counts
  end
end