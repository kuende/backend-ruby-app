class Notification < Sequel::Model(:notifications)
  include Contracts

  plugin :timestamps, :update_on_create => true
  plugin :serialization, :json, :metadata
end
