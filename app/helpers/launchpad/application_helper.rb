module Launchpad
  module ApplicationHelper
    def launchpad_header_tag
      render(partial: 'layouts/launchpad/header')
    end

    def launchpad_surround_tag(&block)
      render(partial: 'layouts/launchpad/surround', locals: { html: capture(&block) })
    end

    def launchpad_menu_tag(&block)
      render(partial: 'layouts/launchpad/menu', locals: { html: capture(&block) })
    end

    def launchpad_menu_item_tag(name, url)
      content_tag(:li) do
        content_tag(:a, name, href: url)
      end
    end
  end
end
