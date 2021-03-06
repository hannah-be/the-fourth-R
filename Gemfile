source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

# Use dotenv to load environment variables in development
gem 'dotenv-rails', groups: [:development, :test]
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.4'
# Use postgresql as the database for Active Record
gem 'pg', '~> 0.18'
# Use Puma as the app server
gem 'puma', '~> 3.7'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development
# Use Stripe for payments
gem 'stripe'
# Use HTTParty to make HTTP fun again
gem 'httparty'
# User Geocoder for geocoding address
gem 'geocoder'
# Use bootstrap for styling
gem 'bootstrap', '~> 4.0.0.beta2.1'
# Shrine Dependencies
gem 'fastimage'
gem 'image_processing'
gem 'mini_magick'
# User Shrine gem for image uploading
gem 'shrine'
# Amazone Web Services for image hosting
gem 'aws-sdk', '~> 3'
# Use Devise for authentication
gem 'devise'
# Use Pundit for authorisation system
gem 'pundit'
# User RailsAdmin for admin interface
gem 'rails_admin', '~> 1.2'
# Omniauth
gem 'omniauth'
# Rails admin integration with Pundit authorisation
gem "rails_admin_pundit", :github => "sudosu/rails_admin_pundit"
# Use MailGun API to send transactional emails
gem 'mailgun-ruby', '~>1.1.6'
# Money gem for formatting prices
gem 'money'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  # Rspec for testing
  gem 'rspec-rails', '~> 3.6'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  # Rails ERD to generate diagrams using GraphViz
  gem 'rails-erd'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
