require 'bundler'

ENV['APP_ENV'] = 'test'

$root_dir = './'
require File.join(File.expand_path(File.join('../..', $root_dir), __FILE__), 'config/boot.rb')

RSpec.configure do |config|

  config.order = "random"
end