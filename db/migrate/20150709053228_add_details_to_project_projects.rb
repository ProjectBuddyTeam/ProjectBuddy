class AddDetailsToProjectProjects < ActiveRecord::Migration
  def change
    add_column :project_projects, :details, :string, null: false, default: ''
  end
end
