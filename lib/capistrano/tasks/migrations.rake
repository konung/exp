namespace :deploy do
  desc 'Runs rake db:migrate'
  task migrate: [:set_rack_env] do
    on fetch(:migration_servers) do
      within release_path do
        with rack_env: fetch(:rack_env) do
          execute :rake, 'db:migrate'
        end
      end
    end
  end

  after 'deploy:cleanup', 'deploy:migrate'
end