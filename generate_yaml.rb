require 'yaml'
require 'securerandom'

puts YAML.dump_stream( *(0..1024 * 10).map{ SecureRandom.hex(512) } )