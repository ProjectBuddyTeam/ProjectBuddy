module ApplicationHelper
  def active_if_on(path)
    'active' if current_page?(path)
  end

  def current_container_selector
    "#{controller_name.downcase.tr('_','-')}-#{action_name.downcase}"
  end

  def current_page_title
    if content_for? :page_title
      yield :page_title
    else
      ''
    end
  end
end