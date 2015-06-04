#!/usr/bin/ruby
# -*- encoding: utf-8 -*-
require "rubygems"
require "nokogiri"
require "open-uri"
require "cgi"
n=0
#本番
 keyword = ARGV[0]
 num_tmp=4
# num_tmp=ARGV[1]

#テスト
#keyword="サンプル"

url_tmp = []

num=num_tmp.to_i - 1
escaped_keyword = CGI.escape(keyword)
url="http://www.google.co.jp/search?ie=UTF-8&oe=UTF-8&q=#{escaped_keyword}"
html = open(url, "r:CP51932").read

doc = Nokogiri::HTML.parse(html, 'CP51932')
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

# Webサイト以外（ニュースなど）はスキップ
next if "#{href}" !~ /^\/url/

# puts "idx: #{idx+1}"
# puts "domain: #{link.split("/")[2]}"
# puts "link: #{link}"
# puts "html: #{html}"
# puts ""
link=URI.unescape("#{link}")



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











