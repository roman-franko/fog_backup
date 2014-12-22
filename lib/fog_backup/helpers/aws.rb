module FogBackup
  module Helpers
    module Aws

      def upload_to_aws(dir)
        S3Uploader.upload_file(
          FogBackup.root.join(dir).to_s,
          FogBackup.config['aws']['bucket_name'],
          {
            s3_key: FogBackup.config['aws']['s3_key'],
            s3_secret: FogBackup.config['aws']['s3_secret'],
            region: FogBackup.config['aws']['region'],
            destination_dir: ''
          })
      end
    end
  end
end
