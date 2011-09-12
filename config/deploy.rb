$:.unshift(File.expand_path('./lib', ENV['rvm_path']))

require 'rvm/capistrano'
require 'bundler/capistrano'

load 'deploy/assets'

# Config

set :application,  'pipegems'
set :host,         'pipegems.org'

role :web,         host
role :app,         host
role :db,          host, primary: true

set :scm,          :git
set :repository,   'git@github.com:kossnocorp/pipegems.git'

set :user,         'a'
set :deploy_to,    '/home/a'

set :use_sudo,     false

set :unicorn_conf, "#{deploy_to}/current/config/unicorn.rb"
set :unicorn_pid,  "#{deploy_to}/shared/pids/unicorn.pid"

set :rails_env,    :production

set :rvm_ruby_string, '1.9.3'
set :rvm_type,        :user

# Tasks

after 'bundle:install', roles: :app do
  # DB
  run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
  run "cd #{release_path} && bundle exec rake db:migrate RAILS_ENV=production"

  # Gems
  run "ln -nfs #{shared_path}/rubygems/gems #{release_path}/public/gems"
  run "ln -nfs #{shared_path}/rubygems/latest_specs.4.8 #{release_path}/public"
  run "ln -nfs #{shared_path}/latest_specs.4.8.gz #{release_path}/public"
  run "ln -nfs #{shared_path}/Marshal.4.8 #{release_path}/public"
  run "ln -nfs #{shared_path}/Marshal.4.8.Z #{release_path}/public"
  run "ln -nfs #{shared_path}/prerelease_specs.4.8 #{release_path}/public"
  run "ln -nfs #{shared_path}/prerelease_specs.4.8.gz #{release_path}/public"
  run "ln -nfs #{shared_path}/quick #{release_path}/public"
  run "ln -nfs #{shared_path}/specs.4.8 #{release_path}/public"
  run "ln -nfs #{shared_path}/specs.4.8.gz #{release_path}/public"
end

namespace :deploy do
  task :restart do
    run "if [ -f #{unicorn_pid} ]; then kill -USR2 `cat #{unicorn_pid}`; else cd #{deploy_to}/current && bundle exec unicorn_rails -c #{unicorn_conf} -E #{rails_env} -D; fi"
  end

  task :start do
    run "bundle exec unicorn_rails -c #{unicorn_conf} -E #{rails_env} -D"
  end

  task :stop do
    run "if [ -f #{unicorn_pid} ]; then kill -QUIT `cat #{unicorn_pid}`; fi"
  end
end
