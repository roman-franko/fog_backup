module FogBackup

  def self.upload_to_aws(dir)
    S3Uploader.upload_directory(
      FogBackup.root.join(dir).to_s,
      FogBackup.config['aws']['bucket_name'],
      {
        s3_key: FogBackup.config['aws']['s3_key'],
        s3_secret: FogBackup.config['aws']['s3_secret'],
        region: FogBackup.config['aws']['region'],
        destination_dir: '',
        threads: FogBackup.config['options']['threads'] || 1
      })
  end

  def self.download_from_ftp(remote_dir)
    host = FogBackup.config['ftp']['host']
    username = FogBackup.config['ftp']['username']
    password = FogBackup.config['ftp']['password']
    tmp_dir = FogBackup.config['options']['tmp_dir'] || FogBackup.root.join('tmp').to_s

    ftp = FtpSync.new host, username, password
    ftp.pull_dir tmp_dir, remote_dir
  end
end

# FogBackup.upload_to_aws('spec')

# FogBackup.download_from_ftp('/pub/mozilla.org/OJI/')