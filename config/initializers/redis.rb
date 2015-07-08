if ENV['REDIS_PROVIDER']
  $redis = Redis.new(:url => ENV[ENV['REDIS_PROVIDER']])
end