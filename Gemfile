# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.1'

gem 'rails', '~> 6.0.0'
gem 'pg'
gem 'puma'
gem 'sass-rails'
gem 'uglifier'
gem 'turbolinks'
gem 'bootsnap', require: false
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
gem 'bootstrap'
gem 'jquery-rails'
gem 'dotenv-rails'
gem 'octicons_helper'
gem 'gon'

group :development do
  gem 'web-console'
  gem 'listen'
  gem 'spring'
  gem 'spring-watcher-listen'
  gem 'annotate'
  gem 'rubocop'
  gem 'rack-mini-profiler'
end

group :test do
  gem 'capybara'
  gem 'rspec_junit_formatter'
  gem 'selenium-webdriver'
end

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'rspec-rails'
end
