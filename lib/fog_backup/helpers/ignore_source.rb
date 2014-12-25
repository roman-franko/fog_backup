module FogBackup::Helpers
  class IgnoreSource
    def initialize(ignore_list)
      @ignore_list = ignore_list
    end

    def ignore?(file)
      !@ignore_list.find { |i| /#{i}/ =~ file }.nil?
    end
  end
end