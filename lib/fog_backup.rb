require 'fog_backup/helpers/archiver'
require 'fog_backup/helpers/aws'
require 'fog_backup/helpers/ftp'
require 'fog_backup/base'

module FogBackup
end


# FogBackup.upload_to_aws('spec')
# FogBackup.download_from_ftp('/pub/mozilla.org/OJI/')
# FogBackup.tar(FogBackup.root.join('tmp').to_s, 'MRJPlugin/', 'tmp/archive.tar.gz')
# Pony.mail(:subject => 'hi', :body => 'Hello there.')