require "redis"
require "json"
require "redis-objects"
require "rubygems"
require "active_record"
require'redis-namespace'
require 'date'
require 'net/http'
require 'json'

ActiveRecord::Base.establish_connection(
  adapter:  "mysql2",
  host:     "localhost",
  username: "root",
  password: "am",
  database: "word_press",
)


# class User < ActiveRecord::Base

#   def push_notice(object, date)
#     l = Redis::List.new(notice_key(date))
#     l << "#{object.class.to_s.underscore}:#{object.id}"
#     notice_counter.incr
#   end

#   def pop_notice(date)
#     l = Redis::List.new(notice_key(date))
#     res = l.pop
#     notice_counter.decr unless res
#     res
#   end

#   private
#   def notice_key(date)
#     "user:#{self.id}:notice:#{date.strftime('%y%m%d')}"
#   end
# end



# class User 
# 	include Redis::Objects
#   counter :my_posts
#   def id
#     1
#   end
# end

# p "testss"
# redis = Redis.new

# redis.set "foo", "bar" 
# redis.set "hoge", "bar" 
# p redis.get "foo"
# p redis.mget "hoge", "foo"


# @value = Redis::Value.new('value_name')
# @value.value = 'aaaaaaaaaaaaa'


# p @value.value
# user = User.new
# p user.id


# p user.my_posts.increment
# p user.my_posts.value
# p user.my_posts.reset


# @newest  = Redis::Value.new('newest_account', :marshal => true)
# @newest.value = "tesaaaaaaaaat"
# puts @newest.value['username']

day = Date.today
@list = Redis::List.new('sample_date', :marshal => true)
@list << {:name => "Nate", :city => "San Diego", :date => "#{day}"}
@list.each do |el|
  puts "#{el[:name]} lives in #{el[:city]} #{el[:date]}"
end


uri = URI('http://weather.livedoor.com/forecast/webservice/json/v1?city=130010')
p uri
weather_data = JSON.parse(Net::HTTP.get(uri))
p tomorrow_forecast = weather_data['forecasts'][1]
forecast_message = "#{tomorrow_forecast['dateLabel']}の天気は#{tomorrow_forecast['telop']}です。" \
  "最高気温は#{tomorrow_forecast['temperature']['max']['celsius']}度、" \
  "最低気温は#{tomorrow_forecast['temperature']['min']['celsius']}度です。"

description = weather_data['description']['text'].gsub(/\n/, '')
p description
# @list = Redis::List.new('list_name', :marshal => true)



# @list = Redis::List.new('list_name')
# @list << 'a'
# # @list << 'b'
# # @list.include? 'c'   # false
# p @list.values  # ['a','b']
# @rlist = Redis::List.new('list_name', :marshal => true)

# @rlist << {:name => "Nate", :city => "San Diego"}

# @rlist.each do |el|
#   puts "#{el[:name]} lives in #{el[:city]}"
# # end

# @hash = Redis::HashKey.new('hash_name')
# @hash['a'] = 1
# @hash['b'] = 2

# @hash.each do |k,v|
#   puts "#{k} = #{v}"
# end

# @hash['c'] = 3

# puts @hash.all

# @list.delete('c')
# @list[0]
# @list[0,1]
# @list[0..1]
# @list.shift
# @list.pop
# @list.clear
# etc

# redis.rpush "tweets", "this is my first tweet."
# redis.rpush "tweets", "hello world!"
# # p redis.lrange "tweets", 0, 100
# # 10.times {|i| redis.rpush("tweets", "tweet #{i}") }


# # redis.lrange "tweets", 0, 10

# st = Time.now;
# # 300.times {|i| redis.rpush("tweets", "tweet #{i}") };
# et = Time.now;
# p redis.lrange "tweets",-4, -1
# p et
# p et-st

# tweet = {:id => 1, :user => "shin", :time => Time.now, :body => "hello redis!"}
# p tweet.to_json

# # p JSON.parse(redis.get("msg_1"))

# home = redis.lrange("home_1", -100, -1).map{|key| JSON.parse(redis.get key)}

# p redis.lrange("home_1", -100, -1)
# home.each do |tweet|
#   # puts "#{tweet["user"]} | #{tweet["body"]} (#{tweet["time"]})"
# end





# class Article 
#   include Redis::Objects
#   sorted_set :ranking

#   # 記事IDごとのスコアをインクリメント
# 	def increment_rank_score
# 	self.ranking.incr(article_id, 1)
# 	end

# 	def increment
	
# 	end

#   # 上位1~5位の記事IDを取得
#   def self.get_ranking
#     article = Article.find(1) # イケてない
#     return article.ranking.members.reverse.slice(0,5)
#   end

# end


# class User 

#   include Redis::Objects

#   counter :notice_counter

# end


# @user = User.find(1)
# @user.notice_counter.incr # お知らせに追加があったとき
# @user.notice_counter.decr # お知らせがpopされたとき
# @user.notice_counter.reset # すべてのお知らせを消去したとき
