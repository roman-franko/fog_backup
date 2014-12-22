module FogBackup
  module Helpers
    module Ftp

      def download_from_ftp(local_dir, remote_dir)
        host = FogBackup.config['ftp']['host']
        username = FogBackup.config['ftp']['username']
        password = FogBackup.config['ftp']['password']

        ftp = FtpSync.new host, username, password
        ftp.pull_dir local_dir, remote_dir
      end
    end
  end
end