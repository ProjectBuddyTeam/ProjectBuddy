module Project::ProjectsHelper
  include ActsAsTaggableOn::TagsHelper

  def project_question_answer_body(q, proj)
    if q.answer.blank?
      if proj.member == current_member
        "<i>I have no answer.</i>"
      else
        "<i>Waiting for the creator to answer.</i>"
      end
    else
      q.answer
    end
  end

  def project_question_answer_actions(q, proj)
    if proj.member == current_member
      '<a href="' + edit_project_question_answer_path(proj, q) + '" class=""> Edit Answer</a>'
    end
  end

  def project_question_actions(q, proj)
    if q.member == current_member
      '<a href="' + edit_project_question_path(proj, q) + '" class=""> Edit Question</a>'
    end
  end
end
