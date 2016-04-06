RAKE_ROOT = File.expand_path(File.dirname(__FILE__))

ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../Gemfile', __FILE__)

require 'bundler/setup' if File.exists?(ENV['BUNDLE_GEMFILE'])
Bundler.require(:default)

Dir.glob('lib/tasks/*.rake').each { |r| load r}
