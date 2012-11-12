require 'machinist/active_record'

module Launchpad
  GoogleAuthUser.blueprint do
    first_name { 'Jesse' }
    last_name { 'Ventura' }
    email { 'jesse@teachbanzai.com' }
  end
end
