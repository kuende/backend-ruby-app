config = DatabaseUrl.to_active_record_hash(CONFIG[:rabbitmq_url])

Hutch::Config.set(:uri, CONFIG[:rabbitmq_url])
Hutch::Config.set(:mq_api_host, config[:host])
