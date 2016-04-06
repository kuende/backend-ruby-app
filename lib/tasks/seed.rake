namespace :db do
  desc "Seed database"
  task :seed => :environment do
    count = 150

    count.times.each do |i|
      NotificationSeedService.perform(SEED_PROFILE_REF_IDS.sample)
    end
  end
end
