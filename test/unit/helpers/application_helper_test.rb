require 'test_helper'

module Launchpad
  class ApplicationHelperTest < ActionView::TestCase
    test "header tag" do
      launchpad_header_tag
      assert_template :header
    end

    test "surround tg" do
      launchpad_surround_tag { "<div class=\"test\"></div>".html_safe }
      assert_select 'div.test'
    end

    test "menu tag" do
      launchpad_menu_tag do
        launchpad_menu_item_tag("Teachers", "http://www.google.com")
      end
      assert_select 'nav.launchpad-menu'
      assert_select 'li'
    end
  end
end
