#
# Cookbook:: ruby
# Recipe:: gems
#
# Copyright:: 2018, The Authors, All Rights Reserved.

gem_package 'bundler' do
  version '1.13.6'
  action :install
end

execute 'bundler install' do
  command 'cd /var/canvas/ && bundler install --path vendor/bundle'
  action :run
end
