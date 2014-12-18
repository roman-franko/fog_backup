module FogBackup
  class Archiver
    class ArchivingError < StandardError; end

    class << self

      def tar(dir, files, file_to_create)
        files_to_archive = [files].flatten
        cmd = "tar -C #{dir} -czf #{file_to_create} #{files_to_archive.join(' ')} 2>&1"
        result = `#{cmd}`.chomp
        fail ArchivingError, result if $? != 0
      end

      def untar(dir, file_to_untar)
        cmd = "tar -C #{dir} -xzf #{file_to_untar} 2>&1"
        result = `#{cmd}`.chomp
        fail ArchivingError, result if $? != 0
      end

      def zip(dir, target, archive_name)
        source = File.join(dir, archive_name)
        cmd = "zip -r -9 #{source} #{target} 2>&1"
        result = `#{cmd}`.chomp
        fail ArchivingError, result if $? != 0
      end

    end
  end
end