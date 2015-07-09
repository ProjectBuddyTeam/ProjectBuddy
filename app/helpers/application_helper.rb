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

  def markdown(text)
    render_options = {
        filter_html: true,
        hard_wrap: true,
        link_attributes: { rel: 'nofollow', target: '_blank' },
    }
    extensions = {
        autolink:           true,
        superscript:        true,
        disable_indented_code_blocks: true,
        fenced_code_blocks: true,
        space_after_headers: true,
    }

    renderer = Redcarpet::Render::HTML.new(render_options)
    markdown = Redcarpet::Markdown.new(renderer, extensions)
    markdown.render(text).html_safe
  end
end