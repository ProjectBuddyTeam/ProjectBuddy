if ENV['REDISCLOUD_URL']
  $redis = Redis.new(:url => ENV['REDIS_URL'])
end