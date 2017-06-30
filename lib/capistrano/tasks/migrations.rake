namespace :deploy do
  desc 'Runs rake db:migrate'
  task :migrate do
    execute :rake, 'RACK_ENV=production db:migrate'
  end

  after 'deploy:cleanup', 'deploy:migrate'
end