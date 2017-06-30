namespace :deploy do
  desc "migrate Production db"
  task :migrate do
    on roles(:app) do
      execute "bundle exec rake RACK_ENV=production db:migrate"
    end
  end
  after :deploy, "deploy:updated"
end
