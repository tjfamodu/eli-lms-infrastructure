#
# Cookbook:: nodejs
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

execute 'Add node PPA' do
  command 'curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -'
  action :run
  not_if 'node -v'
end


package 'nodejs' do
  action :install
end

#include_recipe 'nodejs::yarn'