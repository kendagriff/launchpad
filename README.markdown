# Launchpad

Single Sign-on for Banzai's internal apps, using Google's OpenID and OmniAuth.

## Usage

### 1. Add to Gemfile

```
gem 'launchpad', git: 'git@github.com:kendagriff/launchpad.git'
```

### 2. Mount engine routes in `config/routes.rb`

```
Sponsors::Application.routes.draw do
  mount Launchpad::Engine => "/launchpad"
end
```

### 3. Include helpers and filters in ApplicationController

```
class ApplicationController < ActionController::Base
  include Launchpad::AuthenticationHelper
  helper Launchpad::AuthenticationHelper

  protect_from_forgery
end
```
