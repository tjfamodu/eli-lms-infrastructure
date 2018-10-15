#
# Cookbook:: git
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

apt_package 'git' do
  action :install
end

directory '/var/canvas' do
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

git '/var/canvas' do
  repository 'https://github.com/instructure/canvas-lms.git'
  checkout_branch 'stable'
  action :sync
end

execute 'replace_protocol' do
  command 'git config --global url."https://".insteadOf git://'
  action :run 
end
