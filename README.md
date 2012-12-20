# Launchpad

Single Sign-on for Banzai's internal apps, using Google's OpenID and OmniAuth.

## Usage

### 1. Add to Gemfile

```
gem 'launchpad', git: 'git://github.com/kendagriff/launchpad.git'
```

### 2. Install Migrations

```
rake launchpad:install:migrations
rake db:migrate
```

### 3. Mount engine routes in `config/routes.rb`

```
Sponsors::Application.routes.draw do
  mount Launchpad::Engine => "/launchpad"
end
```

### 4. Include helpers and filters in ApplicationController

```
class ApplicationController < ActionController::Base
  include Launchpad::ApplicationHelper     # template helpers
  include Launchpad::AuthenticationHelper  # authentication helpers
  helper Launchpad::ApplicationHelper
  helper Launchpad::AuthenticationHelper

  protect_from_forgery
end
```

### 5. Call authentication filter in controllers

```
class ExampleController < ApplicationController
  before_filter :require_launchpad_authentication
end
```

### 6. Header View

Include the CSS files:

```
<head>
  <%= stylesheet_link_tag 'launchpad/application' %>
  <%= javascript_include_tag 'launchpad/application' %>
</head>
```

Embed the header and surrounding view:

```
<body>
  <%= launchpad_header_tag %>
  <%= launchpad_surround_tag %>
    <%= yield %>
  <% end %>
</body>
```

## Basic Authentication (for APIs)

Add the following filter to your controller

```
class MyController < ApplicationController
  before_filter :require_basic_authentication
end
```

## Functional Testing

Merely set `@request.session[:user_id]` to a non-`nil` value.

```
@request.session[:user_id] = 1
```

## Integration Testing

Include the `Launchpad::Test` module in your `test_helper.rb`:

```
class ActiveSupport::TestCase
  include Launchpad::Test
  ...
end
```

Call the `login_integration` method within your tests

```
test "testing this" do
  login_integration
end
```

## WebMock

Webmock can get in Google's way, so add this to `config/initializers/webmock.rb`:

```
WebMock.disable!
```
