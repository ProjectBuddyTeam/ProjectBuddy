class CreateProjectProjects < ActiveRecord::Migration
  def change
    create_table :project_projects do |t|
      t.string :codename
      t.string :mission
      t.belongs_to :identity_member, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
