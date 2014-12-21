require 'yaml'

mailer_config = YAML.load_file(FogBackup.root.join 'config/mailer.yml')

Pony.options = {
  :from => mailer_config['from'],
  :to => mailer_config['to'],
  :via => :smtp,
  :via_options => {
    :address        => mailer_config['via_options']['address'],
    :port           => mailer_config['via_options']['port'],
    :user_name      => mailer_config['via_options']['username'],
    :password       => mailer_config['via_options']['password'],
    :authentication => mailer_config['via_options']['authentication'],
    :domain         => mailer_config['via_options']['domain']
  }
}