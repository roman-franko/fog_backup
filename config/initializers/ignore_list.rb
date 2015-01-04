require 'yaml'


ignore_string = File.read(FogBackup.root.join 'config/ignore_list')
FogBackup.ignore_list = ignore_string.split(/\s+/)