# config valid only for Capistrano 3.1
lock '3.17.1'
    
set :application, 'yeti-cloud'
set :repo_url, 'git@github.com:NabinOjha/yeti-cloud.git'

# Default branch is :master
# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }.call
set :branch, "main"
# set :remote_user, 'nginx'
# Default deploy_to directory is /var/www/my_app
# set :deploy_to, "/var/www/webroot/ROOT"

# Default value for :scm is :git
set :scm, :git

# Default value for :format is :pretty
set :format, :pretty

# Default value for :log_level is :debug
# set :log_level, :debug

# Default value for :pty is false
set :pty, true

# Default value for :linked_files is []
# set :linked_files, %w{config/database.yml}

# Default value for linked_dirs is []
# set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5

namespace :deploy do
  desc 'Restart nginx'
  task :nginx do
      on roles(:api) do
          execute :sudo, "service nginx restart"
      end
  end
  desc 'Creating symlink'
  task :symlink do
      on roles(:api) do
          execute :rm, "-rf /var/www/webroot/ROOT"
          execute :ln, "-s /var/www/#{fetch(:application)}/current /var/www/webroot/ROOT"
      end
  end
  desc 'Restart Nginx and create symlink'
  task :restart
  before :restart, :symlink
  before :restart, :nginx
end
after 'deploy:publishing', 'deploy:restart'
