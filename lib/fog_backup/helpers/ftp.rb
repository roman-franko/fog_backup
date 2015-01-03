module FogBackup
  module Helpers
    module Ftp

      def download_from_ftp(local_dir, remote_dir)
        host = FogBackup.config['ftp']['host']
        username = FogBackup.config['ftp']['username']
        password = FogBackup.config['ftp']['password']
        ignore_list = IgnoreSource.new(FogBackup.ignore_list)

        ftp = FtpSync.new(host, username, password,
          ignore: ignore_list,
          verbose: FogBackup.config['ftp']['verbose'],
          passive: FogBackup.config['ftp']['passive'])
        ftp.pull_dir local_dir, remote_dir
      end
    end
  end
end