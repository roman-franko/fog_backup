# set :output, "/path/to/my/cron_log.log"

every 14.days do
  command "cd /home/roman/fog_backup && bundle exec bin/backup"
end