set :output, '/home/muk/workspace/tools/fog_backup/tmp/cron.log'

every 2.minutes do
  rake "backup"
end