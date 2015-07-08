# Preview all emails at http://localhost:3000/rails/mailers/project/question_mailer
class Project::QuestionMailerPreview < ActionMailer::Preview
  def new_question_email
    question = Project::Question.offset(rand(Project::Question.count)).first
    Project::QuestionMailer.new_question_email(question)
  end
end
