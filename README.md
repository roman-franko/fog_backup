#FogBackup

## This tool does:
1. downloads files by ftp
2. archives files
3. uploads archive file to AWS (fog)
4. sends email

##install
1. git clone git@github.com:roman-franko/fog_backup.git
2. bundle install

## Config
create:
* config/backup.yml (user example: backup.yml.example)
* config/mailer.yml (user example: mailer.yml.example)

## Run
* as command: bundle exec bin/backup
* as rake task: bundle exec rake backup
* as cron task (by whenever): bundle exec whenever -w ([whenever](https://github.com/javan/whenever)
