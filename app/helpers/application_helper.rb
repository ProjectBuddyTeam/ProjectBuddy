module ApplicationHelper
  def active_if_on(path)
    'active' if current_page?(path)
  end
end
