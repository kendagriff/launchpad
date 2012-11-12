# Configure Rails Environment
ENV["RAILS_ENV"] = "test"

require File.expand_path("../dummy/config/environment.rb",  __FILE__)
require File.expand_path(File.dirname(__FILE__) + "/blueprints")
require "rails/test_help"

Turn.config.format = :dot

Rails.backtrace_cleaner.remove_silencers!

# Load support files
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }

# Load fixtures from the engine
if ActiveSupport::TestCase.method_defined?(:fixture_path=)
  ActiveSupport::TestCase.fixture_path = File.expand_path("../fixtures", __FILE__)
end

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

module Launchpad
  module Test
    def login_integration
      get_via_redirect '/launchpad/auth/google_apps', { 'omniauth.auth' => OmniAuth.config.mock_auth[:google_apps] }
    end
  end
end
