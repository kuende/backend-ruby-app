namespace :db do
  desc "Create database"
  task :create => :gem_env do
    url =
      if ENV['APP_ENV'] == 'test'
        ENV['TEST_DATABASE_URL']
      else
        ENV['DATABASE_URL']
      end
    uri = DatabaseUrl.to_sequel_hash(url)
    system "createdb -h #{uri[:host]} -U #{uri[:user]} #{uri[:database]}"
  end

  desc "Drop database"
  task :drop => :environment do
    uri = DatabaseUrl.to_sequel_hash(Sequel::Model.db.url)
    Sequel::Model.db.disconnect
    system "dropdb -h #{uri[:host]} -U #{uri[:user]} #{uri[:database]}"
  end

  desc "Show version"
  task :version => :environment do
    version = if Sequel::Model.db.tables.include?(:schema_migrations)
      Sequel::Model.db[:schema_migrations].to_a.reverse.first
    end || {}

    puts "Schema Version: #{version[:filename]}"
  end

  desc "Migrate database"
  task :migrate, [:version] => :environment do |_, args|
    Sequel.extension :migration

    if args[:version]
      puts "Migrating to version #{args[:version]}"
      Sequel::Migrator.run(Sequel::Model.db, "db/migrate", target: args[:version].to_i)
    else
      puts "Migrating to latest"
      Sequel::Migrator.run(Sequel::Model.db, "db/migrate")
    end

    Rake::Task['db:version'].execute
  end

  desc "Rollback database"
  task :rollback, [:version] => :environment do |_, args|
    Sequel.extension :migration

    version = if Sequel::Model.db.tables.include?(:schema_migrations)
      Sequel::Model.db[:schema_migrations].to_a.sort_by{|x| x["filename"]}.reverse[1]
    end || {}

    args.with_defaults(:version => version[:filename])

    Sequel::Migrator.run(Sequel::Model.db, "db/migrate", :target => args[:version].to_i)
    Rake::Task['db:version'].execute
  end

  desc "Perform migration reset (full rollback and migration)"
  task :reset => :environment do
    Sequel.extension :migration

    Sequel::Model.db.loggers = [Logger.new($stdout)]

    Sequel::Migrator.run(Sequel::Model.db, "db/migrate", :target => 0)
    Sequel::Migrator.run(Sequel::Model.db, "db/migrate")
    Rake::Task['db:version'].execute
  end
end
