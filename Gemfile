source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.1'

# Use sqlite3 as the database for Active Record
#gem 'sqlite3'
gem 'pg'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

# for making users
gem 'devise'

# for making forms
gem 'simple_form'

# for displaying calendars
gem 'simple_calendar'

# for making a grid calendar
gem 'foundation-rails'

# for making strings into things
gem 'chronic'

# for uploading files
gem 'carrierwave'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

group :development, :test do
  #gem 'sqlite3', '1.3.8' # suggested by Hartl tutorial
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'spork-rails', '4.0.0' # to speed up tests, suggested by Hartl
  gem 'guard-spork', '1.5.0' # to speed up tests, suggested by Hartl
  gem 'childprocess', '0.3.6' # to speed up tests, suggested by Hartl
  gem 'guard-rspec', '2.5.0' # for automated tests, suggested by Hartl
end

group :test do
  gem 'shoulda'
  gem 'capybara'
  gem 'selenium-webdriver', '2.35.1' # suggested by Hartl tutorial
  gem 'libnotify', '0.8.0' # suggested by Hartl
end

#suggested by Hartl tutorial
group :production do
  gem 'rails_12factor', '0.0.2'
end



# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.1.2'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]
