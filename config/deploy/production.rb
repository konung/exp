server "isascam.com", :user => "deploy", :roles => %{web app db}
set :application, "exp.trb.to"
# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, "/var/www/exp"

set :scm, :git
set :repo_url, "git@github.com:konung/exp.git"
set :branch, "master"

set :rack_env, :production
set :rails_env, :production
set :user, "deploy"
set :use_sudo, false
