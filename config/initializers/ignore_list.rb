require 'yaml'

FogBackup.ignore_list = YAML.load_file(FogBackup.root.join 'config/ignore_list.yml')