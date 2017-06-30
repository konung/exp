namespace :deploy do
  desc 'Runs rake db:migrate'
  task :migrate do
    on fetch(:migration_servers) do
      within :release_path do
          execute :rake, 'RACK_ENV=production db:migrate'
      end
    end
  end

  after 'bundler:install', 'deploy:migrate'
end