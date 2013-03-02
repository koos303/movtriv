source 'https://rubygems.org'

gem 'rails',  :github => "rails/rails", :branch => 'v4.0.0.beta1'
gem 'haml',   :github => "haml/haml"
gem 'factory_girl_rails'
gem 'simple_form'
gem 'carrierwave'
gem 'cocoon', :github => "nathanvda/cocoon"
gem 'mini_magick'
gem 'sentry-raven', :git => "https://github.com/getsentry/raven-ruby.git"
gem 'devise',       :github => "plataformatec/devise", :branch => 'rails4'
gem 'mysql2'

group :development, :test do
  gem 'pry-nav'
  gem 'sqlite3'
end

group :development do
  gem 'better_errors'
  gem 'binding_of_caller'
end

group :assets do
  gem 'sass-rails',   github: 'rails/sass-rails'
  gem 'coffee-rails', github: 'rails/coffee-rails'
  gem 'therubyracer', :platforms => :ruby
  gem 'jquery-rails'
  gem 'uglifier', '>= 1.0.3'
  gem 'bootstrap-sass'
  gem 'font-awesome-sass-rails'
  gem 'turbo-sprockets-rails3'
end

group :test do
  gem 'rspec-rails'
  gem 'shoulda-matchers'
  gem 'capybara-webkit'
  gem 'valid_attribute'
end

group :test_tools do
  gem 'spec_coverage'
end

group :cucumber do
  gem 'cucumber-rails'
  gem 'database_cleaner', github: 'bmabey/database_cleaner'
  gem 'launchy'
  gem 'capybara'
  gem 'selenium-webdriver'
  gem 'fuubar-cucumber'
end
