ENV["APP_ENV"] ||= 'test'

require File.expand_path("../../config/boot", __FILE__)

require 'factory_girl'
require 'faker'

require "rack/test"
require "webmock/rspec"

require "active_support/time"

require "sidekiq/testing"
Sidekiq::Testing.inline!

FactoryGirl.find_definitions

MODELS = [Notification]

Dir[File.expand_path("../support/**/*.rb", __FILE__)].each {|f| require f}

RSpec.configure do |config|
  config.mock_with :rspec

  config.after(:all) do
    MODELS.each do |model|
      model.dataset.destroy
    end
  end

  config.include(CommonMacros)
  config.include(Rack::Test::Methods)
  def app() API::Endpoint end

  config.filter_run focus: true
  # Some tests depends on third party services, so they must be runned manualy
  unless ENV['MANUAL_SPECS']
    config.filter_run_excluding manual: true
  end

  config.filter_run_excluding unimplemented: true

  config.run_all_when_everything_filtered = true
end
