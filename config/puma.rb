if RUBY_ENGINE == "ruby"
  workers Integer(ENV['WEB_CONCURRENCY'] || 2)
end
threads_count = Integer(ENV['MAX_THREADS'] || 16)
threads threads_count, threads_count

rackup      DefaultRackup
port        ENV['API_PORT']     || 9993
environment ENV['APP_ENV'] || 'development'
