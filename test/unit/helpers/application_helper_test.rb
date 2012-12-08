require 'test_helper'

module Launchpad
  class ApplicationHelperTest < ActionView::TestCase
    test "header tag" do
      launchpad_header_tag
      assert_template :header
    end

    test "body tg" do
      launchpad_surround_tag { "<div class=\"test\"></div>".html_safe }
      assert_select 'div.test'
    end
  end
end
