#
# Cookbook:: postgres
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

include_recipe 'postgresql'

postgresql_server_install 'My PostgreSQL Server install' do
  action :install
end

postgresql_server_install 'Setup my PostgreSQL 9.5 server' do
  password 'MyP4ssw0d'
  port 5432
  action :create
end

postgresql_user 'canvas' do
  password 'UserP4ssword'
  createdb false
  createrole false
end

postgresql_database 'canvas_test' do
  owner 'canvas'
end

postgresql_server_conf 'PostgreSQL Config' do
  notifies :reload, service['postgresql']
end
