module Launchpad
  class GoogleAuthUser < ActiveRecord::Base
    attr_accessible :identifier_url, :email, :first_name, :last_name
  end
end
