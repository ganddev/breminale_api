source 'https://rubygems.org'
ruby "2.3.3"

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.3'
# Use sqlite3 as the database for Active Record
#gem 'sqlite3'
gem 'pg', '~> 0.18.4'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc
gem 'rack-cors', :require => 'rack/cors'
gem 'grape'
gem 'grape-entity'
gem 'grape-swagger'
gem 'sorcery'
gem 'jwt'

gem 'slim'
gem 'bootstrap-sass', '~> 3.3.6'
gem 'bootstrap_form'
gem 'devise'

#s3
gem "paperclip", git: "git://github.com/thoughtbot/paperclip.git"
gem 'aws-sdk', '~> 2'

gem 'soundcloud'


gem 'hashie-forbidden_attributes'

gem 'will_paginate', '~> 3.1.0'
gem 'bootstrap-will_paginate', '0.0.10'

gem 'dotenv-rails', :groups => [:development, :test]

# Use ActiveModel has_secure_password
#gem 'bcrypt', '~> 3.1.7'

gem 'rpush'

gem "pundit"

gem 'puma'

gem 'airbrake'

#Authorization
gem 'cancancan', '~> 1.10'

gem 'factory_girl_rails', :group => [:development, :test]

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :test do
  gem 'database_cleaner'
  gem 'email_spec'
  gem 'launchy'
  gem 'capybara'
  gem 'grape-entity-matchers'
end

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  # rspec for unit test
  gem 'rspec-rails', '~> 3.0'
  gem 'byebug'

  # Access an IRB console on exception pages or by using <%= console %> in views
  #gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

