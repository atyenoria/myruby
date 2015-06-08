require 'mongoid'
require 'pry' # binding.pry

Mongoid.load!("/Users/jima/myruby/mongoid.yml", :development) # <=設定ファイルの読み込み（後述）




# # 作成
# User.create(
#   name: "hoge",
#   email: "hoge@example.com"
# )

# # 参照（作成の確認）


# p user

# # 更新
# user.update_attributes(
#   email: "foo@example.com"
# )

# # 参照（更新の確認）
# user = User.where(
#   name: "hoge"
# ).first

# p user

# # 削除
# user.delete

# # 参照（削除の確認）
# user = User.where(
#   name: "hoge"
# ).first

  user = User.new
  user.name = "中島"
  user.email = 21
  user.area = []
  user.area << {:city => "tokyo", :block => "nerima", :lived_in => "2015-03-01"}
  user.save


# puts "Run Pry!"


user = User.last



p user