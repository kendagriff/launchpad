require 'omniauth-google-apps'

module Launchpad
  class Engine < ::Rails::Engine
    isolate_namespace Launchpad

    config.middleware.use 'Rack::OpenID'
    
    config.middleware.use OmniAuth::Builder do
      provider :google_apps, domain: 'teachbanzai.com'
    end
  end
end
