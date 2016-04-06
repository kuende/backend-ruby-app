if Config.env.test?
  Sequel::Model.db = Sequel.connect(CONFIG[:test_database_url], :max_connections => CONFIG[:db_pool])
else
  Sequel::Model.db = Sequel.connect(CONFIG[:database_url], :max_connections => CONFIG[:db_pool])
end
