$root_dir = ENV['APP_ROOT'] || './'
$tmp_dir = ENV['APP_TMP']
require File.join(File.expand_path('../', __FILE__), 'config/boot.rb')
Dir.glob('lib/tasks/*.rake').each { |r| import r }