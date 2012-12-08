class ApplicationController < ActionController::Base
  include Launchpad::ApplicationHelper
  include Launchpad::AuthenticationHelper
  helper Launchpad::ApplicationHelper
  helper Launchpad::AuthenticationHelper

  protect_from_forgery
end
