source "http://rubygems.org"

# Declare your gem's dependencies in launchpad.gemspec.
# Bundler will treat runtime dependencies like base dependencies, and
# development dependencies will be added by default to the :development group.
gemspec

# jquery-rails is used by the dummy application
gem 'jquery-rails'

# Use this temporarily until ruby-openid fixes the bug
gem 'ruby-openid', git: "git://github.com/kendagriff/ruby-openid.git"
gem "omniauth-google-oauth2"

group :assets do
  gem 'coffee-rails'
end

# Internal dependencies via github
gem 'dock', git: 'git://github.com/kendagriff/dock.git'

# Declare any dependencies that are still in development here instead of in
# your gemspec. These might include edge Rails or gems from your path or
# Git. Remember to move these dependencies to your gemspec before releasing
# your gem to rubygems.org.

# To use debugger
# gem 'debugger'
gem 'turn'
gem 'minitest'
gem 'pry'
gem 'pry-nav'
gem 'pry-remote'
gem 'machinist', '>= 2.0.0.beta2', require: 'machinist/active_record'
