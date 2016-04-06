$stdout.sync = true

# Set up gems listed in the Gemfile.
ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../../Gemfile', __FILE__)

require 'bundler/setup' if File.exists?(ENV['BUNDLE_GEMFILE'])

Bundler.require(:default)

# Don't load .env in azk, since developers can have .env for outside azk
unless ENV['AZK_UID']
  require 'dotenv'
  Dotenv.load
end

Config = OpenStruct.new(
  :env => ActiveSupport::StringInquirer.new(ENV.fetch('APP_ENV', 'development')),
  :root => File.expand_path(File.join(File.dirname(__FILE__), '..')),
  :sidekiq_url => ENV.fetch('SIDEKIQ_URL'),
  :sidekiq_namespace => ENV.fetch('SIDEKIQ_NAMESPACE'),
  :db_pool => ENV.fetch('DB_POOL', 16),
  :database_url => ENV.fetch('DATABASE_URL'),
  :test_database_url => ENV.fetch('TEST_DATABASE_URL'),
  :rabbitmq_url => ENV.fetch('RABBITMQ_URL')
)

# load environment dependent gems
Bundler.require(Config.env)

$:.unshift(File.expand_path('../../lib', __FILE__))

autoload_paths = %w(/config/initializers /lib /app /app/models /app/services /app/consumers /app/jobs)

autoload_paths.each do |path|
  file_path = File.join(File.dirname(__FILE__), "..", path)
  $LOAD_PATH.unshift(file_path)
  Dir["#{file_path}/*.rb"].each do |file|
    basename = File.basename(file, ".rb")
    require basename
  end
end
