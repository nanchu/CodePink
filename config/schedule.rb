set :output, "log/this.txt"

every 10.second do
   command "/usr/bin/some_great_command"
   runner "DroneAttackHelper.DataHelper.refreshdb1"
   rake "some:great:rake:task"
end


