config = DatabaseUrl.to_active_record_hash(Config.rabbitmq_url)

Hutch::Config.set(:uri, Config.rabbitmq_url)
Hutch::Config.set(:mq_api_host, config[:host])
