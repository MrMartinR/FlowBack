# Do note that your Web Server should not be running while you are trying to add or remove a Gemfile.
# The arrangement of Gems matter! You have to prioritize (arrange) them based on how you use it.
# Whenever we add a Gem to our Gemfile, we have to run the command "bundle install"

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.5'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.0.2', '>= 6.0.2.2'
# Use postgresql as the database for Active Record
gem 'pg', '>= 0.18', '< 2.0'
# Use Puma as the app server
gem 'puma', '~> 4.1'
# Use SCSS for stylesheets
gem 'sass-rails', '>= 6'

# [Martin] I commented this gem because we are not using react in the backend
# Integrate React.js with Rails views and controllers, the asset pipeline, or webpacker.
# gem 'react-rails'

# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.7'

# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# For login, role

# gem 'devise'
gem 'rolify'
# token based auth
# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
gem 'rack-cors', require: 'rack/cors'

gem 'devise_token_auth'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false

# auto prefixer
gem 'mini_racer'

# pagination
gem 'will_paginate', '~> 3.1.0'

# api doc
# gem 'swagger-docs'
# gem 'rswag'
# image processing
gem 'active_storage_validations'
gem 'image_processing', '~> 1.0'

# searching :
gem 'ransack'
gem 'rubocop', '~>0.81.0'
group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'dotenv-rails', '~> 2.7.6'
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

group :production do
  # [Martin] I commented this two gem because they are duplicated
  # gem 'pg', '>= 0.18', '< 2.0'
  # gem 'rails', '~> 6.0.2', '>= 6.0.2.2'
end
# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
