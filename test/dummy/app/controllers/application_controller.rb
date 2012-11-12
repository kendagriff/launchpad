class ApplicationController < ActionController::Base
  include Launchpad::AuthenticationHelper
  helper Launchpad::AuthenticationHelper

  protect_from_forgery
end
