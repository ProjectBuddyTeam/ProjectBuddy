class Project::QuestionMailer < ApplicationMailer

  def new_question_email(question)
    @question = question
    @project_url = project_project_url(question.project)
    @asker = question.member
    @project_owner = question.project_member
    mail to: @project_owner.email,
         subject: "#{@asker.username} has a question about #{@question.project_codename}"
  end

  def new_answer_email(question)
    @question = question
    @project_url = project_project_url(question.project)
    @asker = question.member
    @project_owner = question.project_member
    mail to: @asker.email,
         subject: "#{@project_owner.username} answered your question: #{@question.question}"
  end
end