require 'yaml'

FogBackup.config = YAML.load_file(FogBackup.root.join 'config/backup.yml')


