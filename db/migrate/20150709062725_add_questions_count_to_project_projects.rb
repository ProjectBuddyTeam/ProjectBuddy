class AddQuestionsCountToProjectProjects < ActiveRecord::Migration
  def change
    add_column :project_projects, :questions_count, :integer
    Project::Project.find_each { |proj| Project::Project.reset_counters(proj.id, :questions) }
  end
end
