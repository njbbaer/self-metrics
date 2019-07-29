# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.1'

# Web-application framework
gem 'rails', '~> 5.2.3'
# Use Postgres as the database for Active Record
gem 'pg'
# Use Puma as the app server
gem 'puma'
# Use SCSS for stylesheets
gem 'sass-rails'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier'
# Makes navigating your web application faster
gem 'turbolinks'
# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap',  require: false
# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
# Includes the Boostrap front-end framework
gem 'bootstrap'
# Boostrap based form builder
gem 'bootstrap_form'
# Includes the jQuery Javascript library
gem 'jquery-rails'
# Loads environment variables from a .env file
gem 'dotenv-rails'
# Includes the Octicon icon pack
gem 'octicons_helper'
# Includes the Highcharts Javascript charting library
gem 'highcharts-rails'
# Send Rails data to JS front-end
gem 'gon'

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console'
  # Listens to file modifications and notifies you about the changes
  gem 'listen'
  # Speeds up development by keeping  application running in the background
  gem 'spring'
  # Makes Spring watch the filesystem for changes using Listen 
  gem 'spring-watcher-listen'
  # Annotate Rails classes with schema and routes info
  gem 'annotate'
  # Ruby static code analyzer and code formatter
  gem 'rubocop'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara'
  # Browser automation framework and ecosystem
  gem 'selenium-webdriver'
  # Easy installation and use of chromedriver to run system tests with Chrome
  gem 'chromedriver-helper'
end

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
end