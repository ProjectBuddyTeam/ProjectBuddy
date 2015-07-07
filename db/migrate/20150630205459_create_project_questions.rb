class CreateProjectQuestions < ActiveRecord::Migration
  def change
    create_table :project_questions do |t|
      t.string :question, null: false
      t.string :answer
      t.belongs_to :project_project, index: true, foreign_key: true
      t.belongs_to :identity_member, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
