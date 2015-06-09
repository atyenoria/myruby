require "active_record"

# データベースへの接続
ActiveRecord::Base.establish_connection(
  adapter:   'sqlite3',
  database:  './test.sqlite'
)

# スキーマの設定
class InitialSchema < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :name
    end
  end

  def self.down
    drop_table :users
  end
end

class CreateSamples < ActiveRecord::Migration
  def change
    create_table :samples do |t|
      t.string :access_token, :null => false, :limit => 6
      t.timestamps
    end
    add_index :samples, :access_token, :unique => true
  end
end


#マイグレーション
# InitialSchema.migrate(:up)
# CreateSamples.migrate(:up)

class User < ActiveRecord::Base
end

# モデルを生成
User.create(name: 'hogehoge')

# 表示
p User.all


p User.find(10)

# # post = User.find(1)
# post.name = 'title new'
# post.save

# post = User.find(1).update(name: 'title new')

# User.where(id: 1..2).update_all(name: 'name_sample')

# User.where(id: 1..3).delete_all

p (65 + rand(26)).chr
p (0...8).map{ (65 + rand(26)).chr }.join
p rand(99)




p (0...8).map{ ('A'..'Z').to_a[rand(26)] }.join



require 'securerandom'
p SecureRandom.hex(8) #=> "e11663225ffdb50c"
p SecureRandom.base64(8) #=> "cIvj9lXP/1M="
p SecureRandom.random_bytes(8) #=> "\xF95\xFF\xCE\x96Ik\xC6" 

