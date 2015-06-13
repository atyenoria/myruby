require 'fileutils'
#for digital ocean

IP_ADDRESS="128.199.202.233"

FileUtils.mv("known_hosts", "known_hosts.org")

open("known_hosts","a") {|wfile|

file = File.open("known_hosts.org")
file.each_line do |line|
  next line if /^#{IP_ADDRESS}/ =~ line
  puts liane
  wfile.puts line
end
file.close

}