# RVM

# $:.unshift(File.expand_path('./lib', ENV['rvm_path']))
require "rvm/capistrano"
set :rvm_ruby_string, 'default'
set :rvm_type, :user

# Bundler

require "bundler/capistrano"

# General

set :application, "mblog"
set :user, "mousse"

set :deploy_to, "/home/#{user}/#{application}"
set :deploy_via, :copy

set :use_sudo, false

# Git

set :scm, :git
set :repository,  "~/ruby_projects/#{application}/.git"
set :branch, "master"

# VPS

role :web, "77.93.202.253:5500"
role :app, "77.93.202.253:5500"
role :db,  "77.93.202.253:5500", :primary => true
role :db,  "77.93.202.253:5500"

# Passenger

namespace :deploy do
	desc 'Re-establish database.yml'
  	task :set_database_symlink do
   	run "rm -fr #{current_path}/config/database.yml && cd #{current_path}/config &&
      	ln -nfs #{shared_path}/database.yml database.yml" 
  end

 task :start do ; end
 task :stop do ; end
 task :restart, :roles => :app, :except => { :no_release => true } do
   run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
 end

# to fix problem with assets not being precompiled on production server
before "deploy:migrate", "deploy:set_database_symlink"
after 'deploy:update_code' do
  	run "cd #{release_path}; RAILS_ENV=production rake assets:precompile"
end 
end