#!/usr/bin/ruby
# -*- encoding: utf-8 -*-
keyword_paste=`pbpaste`
keyword_plus = "とは"
keyword_paste=keyword_paste+keyword_plus
url="http://www.google.co.jp/search?ie=UTF-8\\&oe=UTF-8\\&q=#{keyword_paste}"
system( "chrome_tmp #{url} 1>&2 > /dev/null")
