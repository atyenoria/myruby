require 'yaml'

config = YAML.load_file("yaml_ruby.yml")
# p config #結果①

p config["user"]["name"]
# users=config["user"]

# p users["name"] #結果②

# users.each do |user|
#   puts user #結果③
# end


#2次元ハッシュの初期化
h = Hash.new( {} ) # Hash#new に空配列を渡す

#3次元ハッシュの初期化
h = Hash.new( Hash.new( {} ) ) # Hash.new したものに、さらに二次元で初期化された hash を渡す

h["1"]["2"]["3"] = 3 # (=> エラーになりません.)

p h["1"]["2"]["4"]

#   user.each do |key, value|
#     puts "key:#{key}   value:#{value}" #結果④
#   end

#   if user["name"] == "tarou"
#     puts "my name is #{user["name"]}" #結果⑤
#     puts "my passwd is #{user["pass"]}"
#     puts "my mail address is #{user["mails"]}"
#   end