class WelcomeController < ApplicationController
  before_filter :require_launchpad_authentication

  def index
  end
end
