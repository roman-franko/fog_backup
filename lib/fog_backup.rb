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
    password = FogBackup.config['ftp']['password']
    username = FogBackup.config['ftp']['username']
    Net::SFTP.start(host, username, password: password) do |sftp|
      sftp.download!(remote_dir, FogBackup.root.join('tmp').to_s)
    end
  end
end

# FogBackup.upload_to_aws('spec')

FogBackup.download_from_ftp('sites/all/themes/bartik/templates/')