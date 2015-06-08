require "redis"
require "json"
require "redis-objects"

p "testss"
redis = Redis.new

redis.set "foo", "bar" 
redis.set "hoge", "bar" 
p redis.get "foo"
p redis.mget "hoge", "foo"

redis.rpush "tweets", "this is my first tweet."
redis.rpush "tweets", "hello world!"
# p redis.lrange "tweets", 0, 100
# 10.times {|i| redis.rpush("tweets", "tweet #{i}") }


# redis.lrange "tweets", 0, 10

st = Time.now;
# 300.times {|i| redis.rpush("tweets", "tweet #{i}") };
et = Time.now;
p redis.lrange "tweets",-4, -1
p et
p et-st

tweet = {:id => 1, :user => "shin", :time => Time.now, :body => "hello redis!"}
p tweet.to_json

# p JSON.parse(redis.get("msg_1"))

home = redis.lrange("home_1", -100, -1).map{|key| JSON.parse(redis.get key)}

p redis.lrange("home_1", -100, -1)
home.each do |tweet|
  # puts "#{tweet["user"]} | #{tweet["body"]} (#{tweet["time"]})"
end

