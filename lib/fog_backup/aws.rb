module FogBackup
  class Aws

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
  end
end
