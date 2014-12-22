module FogBackup

  class Base
    include Helpers::Archiver
    include Helpers::Aws
    include Helpers::Ftp

    def initialize
      @timestamp = Time.now.strftime("%Y-%m-%d_%H:%M:%S_UTC")
      set_local_storage
      @archive_path = File.join(@tmp_dir, "#{@timestamp}.tar.gz")
    end

    def run
      download_from_ftp(@local_dir, '/pub/mozilla.org/OJI/')
      tar(@tmp_dir, @timestamp, @archive_path)
      upload_to_aws(@archive_path)
      # Pony.mail(:subject => 'hi', :body => 'Hello there.')
    rescue => e

      p e.message, e.backtrace

      # Pony.mail(
      #   :subject => "Failure backup, time: #{@timestamp}",
      #   :body => "Failure backup with error: #{e.message}")
    ensure
      FileUtils.rm_rf(@local_dir) if File.directory?(@local_dir)
      File.delete(@archive_path) if File.exist?(@archive_path)
    end

    private :tar, :untar, :upload_to_aws, :download_from_ftp

      def set_local_storage
        @tmp_dir = FogBackup.config['options']['tmp_dir'] || FogBackup.root.join('tmp').to_s
        @local_dir = File.join(@tmp_dir, @timestamp)
        FileUtils.mkdir_p(@local_dir) unless File.directory?(@local_dir)
      end
  end
end