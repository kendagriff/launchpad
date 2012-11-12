require_dependency "launchpad/application_controller"

module Launchpad
  class SessionsController < ApplicationController
    def new
      redirect_to_stored
    end

    def create
      user = GoogleAuthUserRepository.find_or_create(request.env['omniauth.auth'])
      session[:user_id] = user.id
      redirect_to main_app.root_url
    end
  end
end
