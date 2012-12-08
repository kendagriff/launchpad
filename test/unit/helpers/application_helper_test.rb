require 'test_helper'

module Launchpad
  class ApplicationHelperTest < ActionView::TestCase
    test "launchpad tag" do
      launchpad_header_tag
      assert_template :header
    end
  end
end
