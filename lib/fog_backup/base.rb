module FogBackup

  class Base
    include Helpers::Archiver
    include Helpers::Aws
    include Helpers::Ftp

  end
end