module FogBackup
  module Helpers
    module Ftp

      def download_from_ftp(remote_dir)
        host = FogBackup.config['ftp']['host']
        username = FogBackup.config['ftp']['username']
        password = FogBackup.config['ftp']['password']
        tmp_dir = FogBackup.config['options']['tmp_dir'] || FogBackup.root.join('tmp').to_s

        ftp = FtpSync.new host, username, password
        ftp.pull_dir tmp_dir, remote_dir
      end
    end
  end
end