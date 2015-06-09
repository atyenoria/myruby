require "redis"
require "json"
require "redis-objects"
require "rubygems"
require "active_record"


ActiveRecord::Base.establish_connection(
  adapter:  "mysql2",
  host:     "localhost",
  username: "root",
  password: "am",
  database: "word_press",
)



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


# @list = Redis::List.new('list_name', :marshal => true)
# @list << {:name => "Nate", :city => "San Diego"}
# @list << {:name => "Peter", :city => "Oceanside", :cicle => "Oceanside", :city => "Oceanside", :city => "Oceanside"}
# @list.each do |el|
#   puts "#{el[:name]} lives in #{el[:city]} #{el[:cicle]}"
# end
# @list = Redis::List.new('list_name', :marshal => true)



# @list = Redis::List.new('list_name')
# @list << 'a'
# @list << 'b'
# @list.include? 'c'   # false
# p @list.values  # ['a','b']
# @list << 'c'
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




























