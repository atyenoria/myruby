#!/usr/bin/ruby
# -*- encoding: utf-8 -*-
require 'mongoid'
require "rubygems"
require "nokogiri"
require "open-uri"
require "cgi"
require "pry"
require "redis"

Mongoid.load!("/Users/jima/myruby/mongoid.yml", :development) # <=設定ファイルの読み込み（後述）

class Geturl
  include Mongoid::Document	
  include Mongoid::Timestamps
  field :keyword, type: String
  field :address, type: String
  field :domain, type: String
  # field :area, type: Array
  # field :created_at, :type => DateTime, :default => lambda{Time.now}
end


n=0

keyword = ARGV[0]
num_tmp=10

#テスト
#keyword="てすと"

url_tmp = []

num=num_tmp.to_i - 1
escaped_keyword = CGI.escape(keyword)
# url="http://www.google.co.jp/search?ie=UTF-8&oe=UTF-8&q=#{escaped_keyword}"
url="https://www.google.co.jp/search?num=20&site=webhp&source=hp&q=%#{escaped_keyword}&oq=#{escaped_keyword}&gs_l=hp.3...1207.2002.0.2213.10.9.0.0.0.2.210.599.2j2j1.5.0....0...1c.1j4.64.hp..8.2.188.0.MoYNA3NR-sk"
html = open(url).read

doc = Nokogiri::HTML.parse(html)
doc.search("div#search ol li").each_with_index do |li, idx|
href = ""
html = ""
link = ""
# aタグの中身を解析
li.search("h3 a").each do |alink|
href = alink.attribute("href")
URI.parse(href).query.split(/&/).each do |str|
strs = str.split(/=/)

link = strs[1] if strs[0] == "q"

end
html = alink.inner_html
end

# binding.pry


# Webサイト以外（ニュースなど）はスキップ
next if "#{href}" !~ /^\/url/

# puts "idx: #{idx+1}"
# puts "domain: #{link.split("/")[2]}"
# puts "link: #{link}"
# puts "html: #{html}"
# puts ""
link=URI.unescape("#{link}")

tweet = {:id => 1, :user => "shin", :time => Time.now, :body => "hello redis!"}



  geturl = Geturl.new
  geturl.keyword = "#{keyword}"
  geturl.address = "#{link}"
  geturl.domain = "#{link.split("/")[2]}"
  geturl.save



#dev
# tweet = {:id => 2, 
#          :user => "shin", 
#          :time => Time.now, 
#          :body => "this is second tweet :-)"
#         }
# redis.set "msg_1", tweet.to_json
# redis.rpush "home_1", "msg_1"


# puts "Run Pry!"

url_tmp.push(link)


n=n+1
if n > num then
	break
end


end





for s in 1..num do
	
	#puts s
#	puts url_tmp[s]
  system( "chrome_tmp #{url_tmp[s]} 1>&2 > /dev/null")
end







