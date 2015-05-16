set :application, 'flippr'
set :repo_url, 'git@github.com:geniitech/flippr.git'
set :deploy_to, "/home/webadmin/hackathon/#{fetch(:application)}"
set :user, 'webadmin'
set :rvm_ruby_version, '2.2.1'

# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }

# set :deploy_to, '/var/www/my_app'
# set :scm, :git

# set :format, :pretty
# set :log_level, :debug
# set :pty, true

set :linked_files, %w{config/database.yml config/secrets.yml config/aws.yml}
set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system public/assets}

# set :default_env, { path: "/opt/ruby/bin:$PATH" }
# set :keep_releases, 5

namespace :setup do
  desc 'Create deploy directory'
  task :create_directory do
    on roles(:app) do
      execute :mkdir, '-p', deploy_to
      execute :chown, "#{fetch(:user)}", deploy_to
    end
  end
end

namespace :deploy do

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      # Your restart mechanism here, for example:
      execute :touch, release_path.join('tmp/restart.txt')
    end
  end

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

  after :finishing, 'deploy:cleanup'

end

namespace :logs do
 desc 'tail rails logs'
  task :tail do
    on roles(:app) do
      trap('INT') { puts 'Y U NO SEE MORE LOGS?!'; exit 0; }
      execute "tail -f #{current_path}/log/#{fetch(:rails_env)}.log"
    end
  end
end

namespace :database do
  desc 'SCP transfer database configuration to the shared folder'
  task :setup do
    on roles(:app) do
      upload! 'config/database.yml', "#{shared_path}/config/database.yml", via: :scp
    end
  end

  desc 'Symlink database.yml to the release path'
  task :symlink do
    on roles(:app) do
      execute "ln -sf #{shared_path}/config/database.yml #{current_path}/config/database.yml"
    end
  end
end

after 'deploy:started', 'database:setup'
after 'deploy:symlink:release', 'database:symlink'

namespace :secrets do
  desc 'SCP transfer secrets configuration to the shared folder'
  task :setup do
    on roles(:app) do
      upload! 'config/secrets.yml', "#{shared_path}/config/secrets.yml", via: :scp
    end
  end

  desc 'Symlink secrets.yml to the release path'
  task :symlink do
    on roles(:app) do
      execute "ln -sf #{shared_path}/config/secrets.yml #{current_path}/config/secrets.yml"
    end
  end
end

after 'deploy:started', 'secrets:setup'
after 'deploy:symlink:release', 'secrets:symlink'

namespace :aws do
  desc 'SCP transfer AWS configuration to the shared folder'
  task :setup do
    on roles(:app) do
      upload! 'config/aws.yml', "#{shared_path}/config/aws.yml", via: :scp
    end
  end

  desc 'Symlink aws.yml to the release path'
  task :symlink do
    on roles(:app) do
      execute "ln -sf #{shared_path}/config/aws.yml #{current_path}/config/aws.yml"
    end
  end
end

after 'deploy:started', 'aws:setup'
after 'deploy:symlink:release', 'aws:symlink'