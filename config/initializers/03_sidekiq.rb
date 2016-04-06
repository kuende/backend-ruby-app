Sidekiq.configure_server do |config|
  config.redis = { :url => Config.sidekiq_url, :namespace => Config.sidekiq_namespace}
end

Sidekiq.configure_client do |config|
  config.redis = { :url => Config.sidekiq_url, :namespace => Config.sidekiq_namespace }
end
