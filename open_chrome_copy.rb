#!/usr/bin/ruby
# -*- encoding: utf-8 -*-
require "rubygems"
require "nokogiri"
require "open-uri"
require "cgi"

n=0

keyword_paste=`pbpaste`
keyword_plus = "とは"

keyword_paste=keyword_paste+keyword_plus
#テスト
# keyword="てすと"

# escaped_keyword = CGI.escape(keyword)

url="http://www.google.co.jp/search?ie=UTF-8\\&oe=UTF-8\\&q=#{keyword_paste}"
system( "chrome_tmp #{url} 1>&2 > /dev/null")

puts url
# sample=`dk --help`

# exec("source ~/.bashrc")

# exec("opg")
# TMP=exec("pbpaste")
# TMP=system("pbpaste")
# puts TMP
# exec("chrome_tmp #{url}")
# puts sample
# test ="https://www.google.co.jp/search?ie=UTF-8&oe=UTF-8&q=%E3%83%86%E3%82%B9%E3%83%88&gws_rd=ssl#q=%E3%83%86%E3%82%B9%E3%83%88%E3%80%80%E3%81%A8%E3%81%AF%E3%80%80%E3%81%A8%E3%81%A8"
# test ="https://www.google.co.jp/search?ie=UTF-8&oe=UTF-8&q=%E3%83%86%E3%82%B9%E3%83%88&gws_rd=ssl#q=%E3%83%86%E3%82%B9%E3%83%88%E3%80%80%E3%81%A8%E3%81%AF"
# test ="https://www.google.co.jp/webhp?gfe_rd=cr&ei=2VNyVZrYBOjM8gfzt4GYCQ&gws_rd=ssl#q=%E3%83%86%E3%82%B9%E3%83%88%E3%81%A8%E3%81%AF"
# linkk=URI.unescape("#{test}")
# puts linkk
