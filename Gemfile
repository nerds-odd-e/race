source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 7.2', '>= 7.2.3.1'
# Use sqlite3 as the database for Active Record
gem 'sqlite3'
# Use Puma as the app server
gem 'puma', '~> 7.2'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 6.0'
# Use Terser as compressor for JavaScript assets (ES6+ aware; uglifier only
# understands ES5 and chokes on the ES6 JS shipped by actioncable 7.2).
gem 'terser', '>= 1.1'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby
gem 'rails-i18n'

# Use jquery as the JavaScript library
gem 'jquery-rails'
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'
gem 'haml-rails', '~> 2.0'

gem 'rqrcode'
gem 'rubocop', require: false

group :development, :test do
  gem 'byebug', platform: :mri
  gem 'rspec-rails'
  gem 'jasmine-rails'
  gem 'rails-controller-testing'
  gem 'factory_bot_rails'
  gem 'cucumber-rails', require: false
  gem 'database_cleaner'
  gem 'rspec-its'
  gem 'guard-rake'
end

group :development do
  gem 'web-console'
  gem 'listen', '~> 3.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  # Ruby no longer bundles this by default; spring-watcher-listen requires it
  # without declaring it as a dependency.
  gem 'mutex_m'
  gem 'capistrano', '~> 3.6'
  gem 'capistrano-rails', '~> 1.1'
  gem 'capistrano-rbenv', '~> 2.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
