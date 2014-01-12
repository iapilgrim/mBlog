# RVM

# $:.unshift(File.expand_path('./lib', ENV['rvm_path']))
require "rvm/capistrano"
set :rvm_ruby_string, 'default'
set :rvm_type, :user

# Bundler

require "bundler/capistrano"

# General

server "77.93.202.210:3400", :web, :app, :db, primary: true

set :application, "mBlog"
set :user, "mousse"

set :deploy_to, "/home/#{user}/apps/#{application}"
set :deploy_via, :copy
#set :deploy_via, :remote_cache

set :use_sudo, false

# Git

set :scm, :git
set :repository,  "~/ruby_projects/#{application}/.git"
set :branch, "master"

after "deploy", "deploy:cleanup" # keep only the last 5 releases



# Passenger

namespace :deploy do
	desc 'Re-establish database.yml'
  	task :set_database_symlink do
      # belongs to code below
      # rm -fr #{current_path}/config/database.yml && 
   	run "cd #{current_path}/config &&
      	ln -nfs #{shared_path}/database.yml database.yml" 
  end

	desc 'run bundle install'
  		task :install_bundle do
        run "cd #{current_path}/config &&
        ln -nfs #{shared_path}/database.yml database.yml" 
    	run "cd #{current_path} && bundle install"
  	end

  desc 'run the migration'
  	task :migrate do
    run "cd #{current_path} && bundle exec rake db:migrate RAILS_ENV=production --trace"
   end

before "deploy:install_bundle", "deploy:set_database_symlink"
before "deploy:migrate", "deploy:install_bundle"
before "deploy:migrate", "deploy:set_database_symlink"
before "deploy:restart", "deploy:migrate"
# to fix problem with assets not being precompiled on production server
# after 'deploy:update_code' do
# 	run "cd #{release_path}; RAILS_ENV=production rake assets:precompile"
#  end 
end