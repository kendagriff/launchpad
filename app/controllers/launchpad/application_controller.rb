module Launchpad
  class ApplicationController < ActionController::Base
    include AuthenticationHelper

    def redirect_to_stored
      if signed_in?
        redirect_to main_app.root_url
      else
        redirect_to '/launchpad/auth/google_oauth2'
      end
    end
  end
end
