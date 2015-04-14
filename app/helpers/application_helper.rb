require "redcarpet"

module ApplicationHelper
  def render_markdown(text)
    renderer_options = { no_images: true, hard_wrap: true }
    renderer = Redcarpet::Render::HTML.new(renderer_options)

    markdown_options = { no_intra_emphasis: true,
                         autolink: true
    }
    markdown = Redcarpet::Markdown.new(renderer, markdown_options)

    markdown.render(text).html_safe
  end
end
