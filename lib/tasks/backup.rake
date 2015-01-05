desc 'backup'
task :backup do
  time = Time.now
  puts "Start backup at #{time}"
  backup = FogBackup::Base.new
  backup.run
  time = (Time.now - time)/60
  puts "Finish. #{time.round(2) } min."
end