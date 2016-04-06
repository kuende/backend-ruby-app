module API
  module Entities
    class NotificationEntity < Grape::Entity
      expose :id
      expose :created_at, :as => :timestamp do |n, options|
        n.created_at.to_time.to_f
      end
      expose :kind, :as => :type
      expose :seen
      expose :message do |n, options|
        n.metadata["message"]
      end
      expose :data do |n, options|
        n.metadata.except("message")
      end
    end
  end
end
