require "bundler/setup"
require "daemons"
require "pathological"
require "thin"

pwd = Dir.pwd
Daemons.run_proc("scouter_server", :monitor => true) do
  Dir.chdir(pwd)  # Fix working directory after daemons sets it to /.
  require "scouter_server"

  Thin::Server.start("0.0.0.0", 8000, ApesScouter::Server)
end
