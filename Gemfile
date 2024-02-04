source "https://rubygems.org"

ruby "3.2.2"
gem "rails", "~> 7.1.3"
gem "sprockets-rails"
gem "pg", "~> 1.1"
gem "puma", ">= 5.0"
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "jbuilder"
gem "redis", ">= 4.0.1"
gem "bootsnap", require: false
gem 'faker'
gem 'grape'
gem 'grape-entity'
gem 'grape-swagger'
gem 'grape-swagger-entity'
gem 'grape-swagger-rails'
gem 'grape-swagger-representable'
gem 'httparty'
gem 'figaro'

group :development, :test do
  gem 'pry'
end

group :development do
  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem "web-console"

  # Add speed badges [https://github.com/MiniProfiler/rack-mini-profiler]
  # gem "rack-mini-profiler"

  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"
end

group :test do
  gem 'rspec-rails', '~> 6.0.0'
  gem "capybara"
  gem "selenium-webdriver"
end

gem "tzinfo-data", platforms: %i[ windows jruby ]