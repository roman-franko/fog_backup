require 'yaml'

FogBackup.config = YAML.load_file(FogBackup.root.join 'config/backup.yml')


FogBackup.config['options']['tmp_dir'] = $tmp_dir if $tmp_dir

unless FogBackup.config['options']['tmp_dir']
  FogBackup.config['options']['tmp_dir'] = FogBackup.root.join('tmp').to_s
end
