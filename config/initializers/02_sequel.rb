if Config.env.test?
  Sequel::Model.db = Sequel.connect(Config.test_database_url, :max_connections => Config.db_pool)
else
  Sequel::Model.db = Sequel.connect(Config.database_url, :max_connections => Config.db_pool)
end
