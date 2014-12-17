Fog.mock!
Fog.credentials_path = File.join($root_dir, 'config/fog_credentials.yml')
connection = Fog::Storage.new(:provider => 'AWS')
connection.directories.create(:key => 'silverstone')