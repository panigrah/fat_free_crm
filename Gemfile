source 'https://rubygems.org'

# Uncomment the database that you have configured in config/database.yml
# ----------------------------------------------------------------------
# gem 'mysql2'
 gem 'sqlite3'
#gem 'pg'

# Removes a gem dependency
def remove(name)
  @dependencies.reject! { |d| d.name == name }
end

# Replaces an existing gem dependency (e.g. from gemspec) with an alternate source.
def gem(name, *args)
  remove(name)
  super
end

# Bundler no longer treats runtime dependencies as base dependencies.
# The following code restores this behaviour.
# (See https://github.com/carlhuda/bundler/issues/1041)
spec = Bundler.load_gemspec(File.expand_path("../fat_free_crm.gemspec", __FILE__))
spec.runtime_dependencies.each do |dep|
  gem dep.name, *(dep.requirement.as_list)
end

# Remove premailer auto-require
gem 'premailer', require: false

# Remove fat_free_crm dependency, to stop it from being auto-required too early.
remove 'fat_free_crm'

group :development do
  # don't load these gems in travis
  unless ENV["CI"]
    #gem 'thin'
    gem 'quiet_assets'
    gem 'capistrano', '~> 3.4.0'
    gem 'capistrano-bundler'
    gem 'capistrano-rails'
    gem 'capistrano-rvm'
    #~ gem 'capistrano-chruby'
    #~ gem 'capistrano-rbenv'
    gem 'guard'
    gem 'guard-rspec'
    gem 'guard-rails'
    gem 'rb-inotify', require: false
    gem 'rb-fsevent', require: false
    gem 'rb-fchange', require: false
    #gem 'opal_hot_reloader', github: "fkchang/opal-hot-reloader"
  end
end

group :development, :test do
  gem 'rspec-rails'
  gem 'rspec-activemodel-mocks'
  gem 'headless'
  gem 'byebug'
  gem 'pry-rails' unless ENV["CI"]
  gem 'factory_girl_rails'
  gem 'puma'
  gem 'reactive_rails_generator'
end

group :test do
  gem 'capybara'
  gem 'selenium-webdriver'
  gem 'database_cleaner'
  gem "acts_as_fu"
  gem 'zeus' unless ENV["CI"]
  gem 'timecop'
end

group :heroku do
  gem 'puma', platform: :ruby
  gem 'rails_12factor'
end

gem 'sass-rails'
gem 'coffee-rails'
gem 'uglifier'
gem 'execjs'
gem 'therubyracer', platform: :ruby unless ENV["CI"]

gem "reform", github: 'apotonick/reform', branch: '2-2'
gem 'reform-rails'
gem "dry-validation", github: 'dry-rb/dry-validation'
gem "trailblazer"
gem "trailblazer-rails"
gem "cells", github: 'apotonick/cells'
gem "cells-rails", github: 'trailblazer/cells-rails'
gem 'trailblazer-cells'
gem "kaminari-cells"
gem 'cells-haml'
gem 'simple_form'
gem 'table_cloth', path: './vendor/table_cloth'
gem 'haml'
gem 'ransack_ui', github: 'panigrah/ransack_ui'
gem 'multi_json'
gem 'roar'
gem 'roar-rails'
gem 'responders'

gem 'reactive-ruby'
gem 'react-rails', '~> 1.3.0'
gem 'opal-rails', '>= 0.8.1'
gem 'therubyracer', platforms: :ruby
gem 'react-router-rails', '~>0.13.3'
gem 'reactive-router'
gem 'reactive-record'