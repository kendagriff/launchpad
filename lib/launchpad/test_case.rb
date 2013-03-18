if Rails.env.test?
  OmniAuth.config.test_mode = true
  OmniAuth.config.mock_auth[:google_apps] = OmniAuth::AuthHash.new({
    provider: 'google_apps',
    uid: '123545',
    info: {
      email: 'kendall@teachbanzai.com',
      first_name: 'Kendall',
      last_name: 'Buchanan'
    }
  })
end

module Launchpad
  module TestCase
    def login_integration
      get_via_redirect '/launchpad/auth/google_apps', { 'omniauth.auth' => OmniAuth.config.mock_auth[:google_apps] }
    end

    def login_functional
      user = GoogleAuthUser.create(
        email: "test@teachbanzai.com",
        first_name: "Demo",
        last_name: "User",
      )
      @request.session[:user_id] = user.id
    end
  end
end
