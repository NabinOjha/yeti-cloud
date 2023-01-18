# config valid for current version and patch releases of Capistrano
lock "~> 3.17.1"

set :application, "yeti-cloud"
set :repo_url, "git@github.com:NabinOjha/yeti-cloud.git"

set :remote_user, 'deploy'
set :ssh_options,
    user: fetch(:remote_user), # overrides user setting above
    forward_agent: true,
    auth_methods: %w[publickey]
    
set :deploy_to, "/home/#{fetch(:remote_user)}/pms-api"
set :branch, ENV.fetch('branch', 'develop')
set :linked_files, %w[config/application.yml config/database.yml config/cable.yml tmp/restart.txt config/aws_config.yml config/storage.yml config/sidekiq.yml config/schedule.yml config/secrets.yml config/honeybadger.yml]


# Set honeybadger server
# set :honeybadger_env, fetch(:stage)
# set :honeybadger_server, -> { roles(:api).first.hostname }
# honeybadger info, using git username
# set :honeybadger_user, `git config user.name`.chomp.gsub(' ', '_')
# Set passenger role
set :passenger_roles, :api

#set :sidekiq_roles, :worker
set :init_system, :systemd
set :bundler_path, '/home/deploy/.rvm/shims/bundler'
#set :sidekiq_config, 'config/sidekiq.yml'


# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
# set :deploy_to, "/var/www/my_app_name"

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# append :linked_files, "config/database.yml"

# Default value for linked_dirs is []
# append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system"

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for local_user is ENV['USER']
# set :local_user, -> { `git config user.name`.chomp }

# Default value for keep_releases is 5
# set :keep_releases, 5

# Uncomment the following to require manually verifying the host key before first deploy.
# set :ssh_options, verify_host_key: :secure