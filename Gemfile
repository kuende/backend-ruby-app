source 'https://rubygems.org'

ruby '2.3.0'

gem 'activesupport', '~> 4.2.1', :require => 'active_support'

# database
gem 'database_url', '~> 0.1.1'
gem 'sequel', '~> 4.21.0'
gem 'pg', '~> 0.18.1'

gem 'redis', '~> 3.2.1'
gem 'connection_pool', '~> 2.2.0'

# manage Procfile
gem 'foreman', '~> 0.78.0'

# Webserver
gem 'puma', '~> 2.15.3'
gem 'grape', '~> 0.8.0'
gem 'grape-entity', '~> 0.4.5'
gem 'grape_logging', '~> 1.1.2'

# Background jobs
gem 'sidekiq', '~> 3.4.1'
gem 'sidekiq-limit_fetch', '~> 2.4.2'

# Nicer console
gem 'pry', '~> 0.10.1'

# Static type checking
gem 'contracts', '~> 0.10'

# load .env files in development
gem 'dotenv', '~> 2.0.2'

group :test do
  gem 'timecop', '~> 0.8.0'
  gem 'rspec', '~> 3.1.0'
  gem 'factory_girl', '~> 4.5.0'
  gem 'faker', '~> 1.4.3'
  gem 'rack-test', '~> 0.6.3'
  gem 'webmock', '~> 1.21.0'
  gem 'fakeredis', '~> 0.5.0'
end
