module Launchpad
  module ApplicationHelper
    def launchpad_header_tag
      render(partial: 'layouts/launchpad/header')
    end

    def launchpad_surround_tag(&block)
      render(partial: 'layouts/launchpad/surround', locals: { html: capture(&block) })
    end
  end
end
