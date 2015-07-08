class Project::QuestionMailer < ApplicationMailer

  def new_question_email(question)
    @question = question
    @project_url = project_project_url(question.project)
    @asker = question.member
    @project_owner = question.project_member
    mail to: @project_owner.email,
         subject: "#{@asker.username} has a question about #{@question.project_codename}"
  end
end