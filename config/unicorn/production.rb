root = "/var/www/sdsh_app/current"
working_directory root

pid "#{root}/tmp/pids/unicorn.pid"

stderr_path "#{root}/log/unicorn_err.log"
stdout_path "#{root}/log/unicorn_out.log"

worker_processes 4
timeout 30
preload_app true

# Use shared socket directory instead of /tmp
listen "#{root}/tmp/sockets/unicorn.sock", backlog: 64

# Graceful restart on USR2
before_fork do |server, worker|
  Signal.trap "TERM" do
    puts "Unicorn master intercepting TERM and sending myself QUIT instead"
    Process.kill "QUIT", Process.pid
  end

  # Close DB connections before fork
  defined?(ActiveRecord::Base) and ActiveRecord::Base.connection.disconnect!
end

after_fork do |server, worker|
  Signal.trap "TERM" do
    puts "Unicorn worker intercepting TERM and exiting"
    exit(0)
  end

  # Reconnect to DB after fork
  defined?(ActiveRecord::Base) and ActiveRecord::Base.establish_connection
end
