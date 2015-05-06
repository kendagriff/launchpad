require "openid"
require 'omniauth-google-oauth2'
require 'launchpad/test_case'

module Launchpad
  class Engine < ::Rails::Engine
    isolate_namespace Launchpad

    # config.middleware.use 'Rack::OpenID'
    
    # config.middleware.use OmniAuth::Builder do
    #   provider :google_apps, domain: 'teachbanzai.com'
    # end

    config.middleware.use OmniAuth::Builder do
      provider :google_oauth2, ENV["GOOGLE_CLIENT_ID"], ENV["GOOGLE_CLIENT_SECRET"]
    end
  end
end
