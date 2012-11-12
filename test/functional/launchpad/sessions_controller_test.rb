require 'test_helper'

module Launchpad
  class SessionsControllerTest < ActionController::TestCase
    test "new session takes you to google login form" do
      get :new, use_route: 'launchpad'
      assert_redirected_to '/launchpad/auth/google_apps'
    end

    test "user signed in goes to root url" do
      user = GoogleAuthUser.make!
      @request.session[:user_id] = user.id
      get :new, use_route: 'launchpad'
      assert_redirected_to '/'
    end
  end
end
