#!/usr/bin/ruby
# -*- encoding: utf-8 -*-
keyword_paste=`pbpaste`
keyword_paste_tmp=keyword_paste.gsub(/ |　/,"+")
keyword=keyword_paste_tmp+"+とは"

url="https://www.google.co.jp/search?ie=UTF-8\\&oe=UTF-8\\&q=#{keyword}"

p url
system( "chrome_tmp #{url} 1>&2 > /dev/null")
