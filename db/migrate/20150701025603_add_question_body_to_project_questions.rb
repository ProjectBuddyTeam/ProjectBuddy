class AddQuestionBodyToProjectQuestions < ActiveRecord::Migration
  def change
    add_column :project_questions, :question_body, :string, null: false, default: ''
  end
end
