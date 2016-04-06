source 'https://rubygems.org'

ruby '2.3.0'

gem 'activesupport', '~> 4.2.6', :require => 'active_support'

gem 'rake', '~> 11.1.2'

# database
gem 'database_url', '~> 0.1.1'
gem 'sequel', '~> 4.33.0'
gem 'pg', '~> 0.18.4'

# Sidekiq
gem 'redis', '~> 3.2.2'
gem 'redis-namespace', '~> 1.5.2'
gem 'connection_pool', '~> 2.2.0'

# rabbitmq
gem 'hutch', '~> 0.21.0'

# manage Procfile
gem 'foreman', '~> 0.78.0'

# Webserver
gem 'puma', '~> 3.3.0'
gem 'grape', '~> 0.16.1'
gem 'grape-entity', '~> 0.5.1'
gem 'grape_logging', '~> 1.2.1'

# Background jobs
gem 'sidekiq', '~> 4.1.1'
gem 'sidekiq-limit_fetch', '~> 3.1.0'

# Nicer console
gem 'pry', '~> 0.10.3'

# Static type checking
gem 'contracts', '~> 0.13.0'

# load .env files in development
gem 'dotenv', '~> 2.1.1'

group :test do
  gem 'timecop', '~> 0.8.1'
  gem 'rspec', '~> 3.4.0'
  gem 'factory_girl', '~> 4.7.0'
  gem 'faker', '~> 1.6.3'
  gem 'rack-test', '~> 0.6.3'
  gem 'webmock', '~> 1.24.0'
  gem 'fakeredis', '~> 0.5.0'
end
