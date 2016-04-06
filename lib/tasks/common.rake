desc "Load environment"
task :environment do
  require File.join(RAKE_ROOT, 'config', 'boot')
end

desc "Load only gem environment"
task :gem_env do
  # Set up gems listed in the Gemfile.
  ENV['BUNDLE_GEMFILE'] ||= File.join(RAKE_ROOT, 'Gemfile')

  require 'bundler/setup' if File.exists?(ENV['BUNDLE_GEMFILE'])

  Bundler.require(:default)

  # Don't load .env in azk, since developers can have .env for outside azk
  unless ENV['AZK_UID']
    require 'dotenv'
    Dotenv.load
  end
end

desc "Load a console"
task :console => :environment do
  Pry.start
end
