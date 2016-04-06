class API::V1 < Grape::API
  unless Config.env.test?
    logger.formatter = GrapeLogging::Formatters::Default.new
    use GrapeLogging::Middleware::RequestLogger, { logger: logger }
  end

  autoload :PingAPI, 'api/v1/ping_api'
  autoload :NotificationAPI, 'api/v1/notification_api'

  mount API::V1::PingAPI
  mount API::V1::NotificationAPI
end
