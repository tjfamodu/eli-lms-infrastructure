#
# Cookbook:: apache
# Recipe:: ssl
#
# Copyright:: 2018, The Authors, All Rights Reserved.

execute 'sudo a2enmod ssl' do
  action :run
end
