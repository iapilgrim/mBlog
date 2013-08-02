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
 task :start do ; end
 task :stop do ; end
 task :restart, :roles => :app, :except => { :no_release => true } do
   run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
 end
end