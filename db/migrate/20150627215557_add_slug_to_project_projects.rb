class AddSlugToProjectProjects < ActiveRecord::Migration
  def change
    add_column :project_projects, :slug, :string
    add_index :project_projects, :slug, unique: true
  end
end
