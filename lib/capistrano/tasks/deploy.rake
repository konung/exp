namespace :deploy do
  desc "migrate Production db"
  task :migrate do
    on roles(:app) do
      within release_path do
        execute "rake RACK_ENV=production db:migrate"
      end
    end
  end
  after 'deploy:updated', 'deploy:migrate'
end