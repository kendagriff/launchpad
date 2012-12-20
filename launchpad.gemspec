$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "launchpad/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "launchpad"
  s.version     = Launchpad::VERSION
  s.authors     = ["Kendall Buchanan"]
  s.email       = ["kendall@teachbanzai.com"]
  s.homepage    = "http://teachbanzai.com"
  s.summary     = "Single Sign-on For Banzai's Internal Apps"
  s.description = "Single Sign-on for Banzai's internal apps via Google OpenID and OmniAuth."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2.8"
  s.add_dependency "omniauth-google-apps"
  s.add_dependency "eco"

  s.add_development_dependency "sqlite3"
end
