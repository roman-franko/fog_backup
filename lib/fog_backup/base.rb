module FogBackup

  class Base
    include Helpers::Archiver
    include Helpers::Aws
    include Helpers::Ftp

    def initialize
      @timestamp = Time.now
      set_local_storage
      @archive_path = File.join(@tmp_dir, "#{formatted_time @timestamp}.tar.gz")
    end

    def run
      download_from_ftp(@local_dir, FogBackup.config['ftp']['target_dir'])
      tar(@tmp_dir, formatted_time(@timestamp), @archive_path)
      upload_to_aws(@archive_path)
      Pony.mail(
        :subject => "Successful backup, time: #{@timestamp}",
        :body => %Q(
          Spent time: #{spent_time};
          Archive size: #{archive_size};
        ))
    rescue => e
      Pony.mail(
        :subject => "Failure backup, time: #{@timestamp}",
        :body => "Failure backup with error: #{e.message}")
    ensure
      FileUtils.rm_rf(@local_dir) if File.directory?(@local_dir)
      File.delete(@archive_path) if File.exist?(@archive_path)
    end

    private :tar, :untar, :upload_to_aws, :download_from_ftp

      def formatted_time(t)
        t.strftime("%Y-%m-%d_%H:%M:%S_UTC")
      end

      def spent_time
        finish = Time.now
        elapsed = finish.to_f - @timestamp.to_f
        mins, secs = elapsed.divmod 60.0
        "%d:%04.2f" % [mins.to_i, secs]
      end

      def archive_size
        "%.#{0}f KB" % [File.size?(@archive_path)/1024.0]
      end

      def set_local_storage
        @tmp_dir = FogBackup.config['options']['tmp_dir']
        @local_dir = File.join @tmp_dir, formatted_time(@timestamp)
        FileUtils.mkdir_p(@local_dir) unless File.directory?(@local_dir)
      end
  end
end