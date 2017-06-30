# config valid only for current version of Capistrano
lock "3.8.2"

# Instead of storing keys on the server. Make sure ssh-agent is up and running on the local machine.
set :ssh_options, { :forward_agent => true }

# Default value for :format is :airbrussh.
set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :linked_files is []
append :linked_files, "config/secrets.yml", ".env.production"

# Default value for linked_dirs is []
append :linked_dirs, "log", "public", "tmp/pids", "tmp/cache", "tmp/sockets", "uploads"

# Default value for keep_releases is 5
set :keep_releases, 5

set :passenger_restart_with_touch, true

namespace :deploy do
  task :start, :roles => :app do
    run "touch #{current_release}/tmp/restart.txt"
  end

  task :stop, :roles => :app do
    # Do nothing.
  end

  desc "Restart Application"
  task :restart, :roles => :app do
    run "touch #{current_release}/tmp/restart.txt"
  end
end