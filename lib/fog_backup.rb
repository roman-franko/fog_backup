module FogBackup

end

require 'fog_backup/archiver'
require 'fog_backup/aws'
require 'fog_backup/ftp'




# FogBackup::Aws.upload_to_aws('spec')
# FogBackup::Ftp.download_from_ftp('/pub/mozilla.org/OJI/')
# FogBackup::Archiver.tar(FogBackup.root.join('tmp').to_s, 'MRJPlugin/', 'tmp/archive.tar.gz')
