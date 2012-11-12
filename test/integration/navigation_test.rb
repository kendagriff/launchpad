require 'test_helper'

class NavigationTest < ActionDispatch::IntegrationTest
  test "unauthenticated user goes to root and is redirected" do
    get main_app.root_url
    assert_redirected_to launchpad.new_session_url
  end
end

