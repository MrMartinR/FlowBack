# Do note that your Web Server should not be running while you are trying to add or remove a Gemfile.
# The arrangement of Gems matter! You have to prioritize (arrange) them based on how you use it.
# Whenever we add a Gem to our Gemfile, we have to run the command "bundle install"

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

# The Ruby Programming Language | https://github.com/ruby/ruby
ruby '2.6.5'

# Bundle edge Rails instead: gem 'rails' | https://github.com/rails/rails
gem 'rails', '6.0.3.4'

# Use postgresql as the database for Active Record | https://github.com/ged/ruby-pg
gem 'pg', '>= 0.18', '< 2.0'

# Puma is a simple, fast, threaded, and highly concurrent HTTP 1.1 server for Ruby/Rack applications. | https://github.com/puma/puma
gem 'puma', '~> 4.1'
# Use SCSS for stylesheets
# gem 'sass-rails', '>= 6'

# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.7'

# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Very simple Roles library without any authorization enforcement supporting scope on resource objects (instance or class). | https://github.com/RolifyCommunity/rolify/
gem 'rolify'

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible | https://github.com/cyu/rack-cors
gem 'rack-cors', require: 'rack/cors'

# Token based authentication for Rails JSON APIs. | https://github.com/lynndylanhurley/devise_token_auth
gem 'devise_token_auth'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# --- [ Image Processing ] ---
# [REV] discuss if manage this on frontend or backend
# If you are using active_storage (image_processing gem??) gem and you want to add simple validations for it, like presence or content_type you need to write a custom validation method. This gems doing it for you. | https://github.com/igorkasyanchuk/active_storage_validations
gem 'active_storage_validations'
# High-level wrapper for processing images for the web with ImageMagick or libvips. | https://github.com/janko/image_processing/
gem 'image_processing', '~> 1.2'

# Reduces boot times through caching; required in config/boot.rb | https://github.com/Shopify/bootsnap/
# commented due permission problems doing migrations https://github.com/Shopify/bootsnap/issues/77
# also commented the line in the boot.rb file
# gem "bootsnap", ">= 1.4.2", require: false

# Minimal embedded v8 engine for Ruby - auto prefixer | https://github.com/rubyjs/mini_racer
gem 'mini_racer'

# Provides a simple API for performing paginated queries with Active Record | https://github.com/mislav/will_paginate/
gem 'will_paginate', '~> 3.1.0'

# [REV] what happened with this??
# api doc
# gem 'swagger-docs'
# gem 'rswag'

# Searching :
# Ransack enables the creation of both simple and advanced search forms for your Ruby on Rails application It improves and expands upon MetaSearch's functionality, but does not have a 100%-compatible API | https://github.com/activerecord-hackery/ransack/
gem 'ransack'

# cron manager
gem 'whenever'

# jsonapi-serializer
gem 'jsonapi-serializer'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: %i[mri mingw x64_mingw]

  # A Ruby static code analyzer and formatter, based on the community Ruby style guide. | https://github.com/rubocop-hq/rubocop
  gem 'rubocop', '~> 1.8', require: false

  # YARD is a documentation generation tool for the Ruby programming language.
  gem 'yard'

  # Sajjad installed this gem
  gem 'dotenv-rails', '~> 2.7.6'
  gem 'factory_bot_rails'
  gem 'rspec-rails', '~> 4.0.2'
end

group :development do
  # gem "rspec"
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'web-console', '>= 3.3.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  # Easy installation and use of web drivers to run system tests with browsers
  gem 'webdrivers'
end

# group :production do
# end
# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
