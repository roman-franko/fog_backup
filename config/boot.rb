require 'rubygems'
require 'pathname'
require 's3_uploader'
require 'ftp_sync'
require 'pony'

$LOAD_PATH.push File.expand_path('../../lib', __FILE__)

module FogBackup

  class << self

    attr_accessor :config

    def root
      Pathname.new(File.expand_path $root_dir, __FILE__)
    end
  end
end


Dir["#{FogBackup.root.join('config/initializers')}/*.rb"].sort.each { |f| require f }

require FogBackup.root.join 'lib', 'fog_backup'



