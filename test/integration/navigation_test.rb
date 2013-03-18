require 'test_helper'

class NavigationTest < ActionDispatch::IntegrationTest
  include Launchpad::TestCase

  test "unauthenticated user goes to root and is redirected" do
    get main_app.root_url
    assert_redirected_to launchpad.new_session_url
  end

  test "successfully authenticate" do
    login_integration
    get main_app.root_url
    assert_match(/My Name/, response.body)
  end
end

