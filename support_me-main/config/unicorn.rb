worker_processes 1

# We deploy with capistrano, so "current" links to root dir of current release
working_directory "/home/jemaddux/supportme/current"

# Listen on unix socket
listen "/tmp/unicorn.supportme.sock", :backlog => 64

pid "/home/jemaddux/supportme/current/tmp/pids/unicorn.pid"

stderr_path "/home/jemaddux/supportme/current/log/unicorn.log"
stdout_path "/home/jemaddux/supportme/current/log/unicorn.log"
