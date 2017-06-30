lock "3.8.2"

set :application, "exp"
set :repo_url, "git@github.com:konung/exp.git"
set :branch, "master"
set :deploy_to, "/var/www/exp"
set :rack_env, :production
set :rails_env, :production
set :user, "deploy"
set :use_sudo, false
set :rbenv_type, :user
set :rbenv_ruby, File.read('.ruby-version').strip
set :ssh_options, { :forward_agent => true }
set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto
append :linked_files, "config/secrets.yml", ".env.production"
append :linked_dirs, "log", "public", "tmp/pids", "tmp/cache", "tmp/sockets", "uploads"