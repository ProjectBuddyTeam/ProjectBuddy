class AddStatusToProjectProjects < ActiveRecord::Migration
  def change
    add_column :project_projects, :status, :integer, default: 0, null: false
  end
end
