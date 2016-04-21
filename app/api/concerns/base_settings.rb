module API::Concerns::BaseSettings
  extend ActiveSupport::Concern

  included do
    format :json
    version 'v1'

    rescue_from :all do |e|
      e.backtrace.first(20).each{|l| logger.error(l)}

      Rack::Response.new({
        messages: [e.try(:message)],
        errors: e.try(:errors)
      }.to_json, (e.status rescue 500))
    end

    helpers do
      def logger
        API::V1.logger
      end

      def require_user!
        if current_user.nil?
          error!({ :errors => { :user => ["unauthorized"]}, :messages => ["Please login first"] }, 401)
        end
      end

      def current_user
        @current_user ||= AuthService.perform(headers)
      end

      def error_404!(key)
        error!({ :errors => {key.downcase => ["not found"]}, :messages => ["Record not found"] }, 404)
      end
    end
  end
end
