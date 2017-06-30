namespace :deploy do
  task :set_rails_env do
    set :rails_env, (fetch(:rails_env) || fetch(:stage))
  end
end

Capistrano::DSL.stages.each do |stage|
  after stage, 'deploy:set_rails_env'
end


namespace :deploy do
  desc 'Runs rake db:migrate if migrations are set'
  task :migrate => [:set_rails_env] do
    on fetch(:migration_servers) do
      within release_path do
        with rails_env: fetch(:rails_env) do
          execute :rake, 'RACK_ENV=production db:migrate'
        end
      end
    end
  end


  desc 'Runs rake db:migrate'
  task migrating: [:set_rails_env] do
    on fetch(:migration_servers) do
      within release_path do
        with rails_env: fetch(:rails_env) do
          execute :rake, 'RACK_ENV=production db:migrate'
        end
      end
    end
  end

  after 'deploy:updated', 'deploy:migrate'
end
