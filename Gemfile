source 'https://rubygems.org'

ruby '3.3.5'

gem 'rails', '~> 8.1.1'

gem 'aws-sdk-s3', require: false
gem 'bcrypt', '~> 3.1.20'
gem 'image_processing', '~> 1.14.0'
gem 'importmap-rails'
gem 'jbuilder'
gem 'meta-tags'
gem 'pagy', '~> 9.4.0'
gem 'pg', '~> 1.6.2'
gem 'pry'
gem 'puma', '>= 7.1.0'
gem 'redis', '>= 5.4.1'
gem 'sprockets-rails'
gem 'stimulus-rails'
gem 'tailwindcss-rails', '~> 4.4.0'
gem 'turbo-rails'

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem 'kredis'

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[windows jruby]

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', require: false

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem 'brakeman', require: false
  gem 'debug', platforms: %i[mri windows]
  gem 'rubocop'
end

group :development do
  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem 'web-console'

  # Add speed badges [https://github.com/MiniProfiler/rack-mini-profiler]
  # gem 'rack-mini-profiler'

  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem 'spring'
end

group :test do
  # Use system testing [https://guides.rubyonrails.org/testing.html#system-testing]
  gem 'capybara'
  gem 'selenium-webdriver'
end
