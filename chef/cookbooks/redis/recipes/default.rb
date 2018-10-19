#
# Cookbook:: redis
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

apt_repository 'nginx-php' do
  uri          'ppa:chris-lea/redis-server'
end

execute 'sudo apt-get update' do
  action :run
end

apt_package 'redis-server' do
  action :install
end

service "redis-server" do
  action [:enable, :start]
end
