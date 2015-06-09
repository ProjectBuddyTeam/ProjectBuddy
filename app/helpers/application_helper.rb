module ApplicationHelper
  def active_if_on(path)
    'active' if current_page?(path)
  end

  def current_container_selector
    "#{controller_name.downcase}-#{action_name.downcase}"
  end
end