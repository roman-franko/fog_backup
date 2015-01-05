require 'rubygems'
require 'pathname'
require 's3_uploader'
require 'ftp_sync'
require 'pony'

$LOAD_PATH.push File.expand_path('../../lib', __FILE__)

module FogBackup

  class << self

    attr_accessor :config, :ignore_list

    def root
      Pathname.new(File.expand_path File.join('../../',$root_dir), __FILE__)
    end
  end
end


Dir["#{FogBackup.root.join('config/initializers')}/*.rb"].sort.each { |f| require f }
Dir[FogBackup.root.join("lib/", "**/*.rb")].each { |f| require f }

