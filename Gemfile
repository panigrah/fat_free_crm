source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '>= 5.0.0.beta3', '< 5.1'
gem 'sqlite3'
gem 'puma'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'

# See https://github.com/rails/execjs#readme for more supported runtimes
gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
gem 'jquery-ui-rails'
gem 'turbolinks', '~> 5.x'
gem 'jbuilder', '~> 2.0'

# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

gem 'paperclip'
gem 'cocaine'
gem 'paper_trail'
gem 'acts_as_commentable'


gem 'select2-rails'
gem 'haml'
gem 'sass'
gem 'acts_as_list'
gem 'ffaker'
gem 'cancancan'
gem 'font-awesome-rails'
gem 'premailer'
gem 'nokogiri'
gem 'rails-jquery-autocomplete'
gem 'psych'
gem 'thor'
gem 'rails_autolink'
gem 'coffee-script-source'
gem 'country_select'
gem 'ransack'
gem 'email_reply_parser_ffcrm'
gem 'responders'
gem 'simple_form'
gem 'will_paginate'

#Gems that have bug fixes on them at head OR local changes
gem 'acts-as-taggable-on', github: 'mbleigh/acts-as-taggable-on'
gem 'authlogic', path: 'lib/authlogic'
gem 'rails-observers', github: 'rails/rails-observers'

#Gems to retire and look for alternatives
#gem 'sprocket-rails'
#gem 'dynamic_form' #get rid of this one - no longer developed
#gem 'responds_to_parent' #get rid of this? not supported this is UI gem - pjax or turbolinks3
#gem 'ransack_ui', path: 'lib/ransack_ui' - searching related lists failing - need alternative

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
  gem 'rspec-rails', github: 'rspec/rspec-rails'
  gem 'rspec-mocks', github: 'rspec/rspec-mocks'
  gem "rspec-core", github: "rspec/rspec-core", branch: "master"
  gem "rspec-support", github: "rspec/rspec-support", branch: "master"
  gem "rspec-expectations", github: "rspec/rspec-expectations", branch: "master"
  gem 'headless'
  gem 'pry-rails' unless ENV["CI"]
  gem 'factory_girl_rails'
end

group :test do
  gem 'capybara'
  gem 'selenium-webdriver'
  gem 'database_cleaner'
  gem "acts_as_fu"
  gem 'zeus' unless ENV["CI"]
  gem 'timecop'
  gem 'rails-controller-testing'
end

group :heroku do
  gem 'rails_12factor'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 3.0'
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'

    gem 'thin'
    gem 'quiet_assets'
    gem 'capistrano'
    gem 'capistrano-bundler'
    gem 'capistrano-rails'
    gem 'capistrano-rvm'
#    gem 'guard'
#    gem 'guard-rspec'
#    gem 'guard-rails'
    gem 'rb-inotify', require: false
    gem 'rb-fsevent', require: false
    gem 'rb-fchange', require: false
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
