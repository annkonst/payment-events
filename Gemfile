source 'https://rubygems.org'
ruby '2.3.0'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.1.8'
# Use sqlite3 as the database for Active Record
# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.3'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer',  platforms: :ruby
gem 'date_validator', '0.9.0'
# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
#gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0',          group: :doc

# Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
group :development do
  gem 'spring'
  gem 'sqlite3'
end

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

gem 'devise'
# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]

group :production do
  gem 'pg', '0.18.4'
  gem 'rails_12factor', '0.0.3'
end

gem 'bootstrap-sass', '~> 3.3.5'
# gem 'sass-rails',  '>= 3.2'
gem 'rails-i18n', '~> 4.0.0'

gem 'bootstrap-sass-extras'
gem 'bootstrap_form'

gem 'paperclip', '~> 4.3'
gem 'slim-rails'
gem 'app'
gem 'aws-sdk', '< 2.0'
gem 'figaro'
# gem 'exception_notification'
# gem 'bullet', :group => 'development'
# gem 'newrelic_rpm'

group :development, :test do
  gem 'rspec-rails', '~> 3.0'
  gem 'pry-rails'
end

group :test do
  gem 'webmock'
  gem 'selenium-webdriver'
  gem 'cucumber-rails', require: false
  # database_cleaner is not required, but highly recommended
  gem 'database_cleaner'
  gem 'poltergeist'
end
