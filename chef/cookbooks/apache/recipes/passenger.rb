#
# Cookbook:: apache
# Recipe:: passenger
#
# Copyright:: 2018, The Authors, All Rights Reserved.

package %w(dirmngr gnupg apt-transport-https ca-certificates apache2) do
  action :install
end


apt_repository 'passenger' do
  uri 'https://oss-binaries.phusionpassenger.com/apt/passenger'
  distribution 'xenial'
  key '561F9B9CAC40B2F7'
  keyserver 'keyserver.ubuntu.com'
  components ['main']
  notifies :update, 'apt_update[passenger]', :immediately
end

apt_update 'passenger' do
  ignore_failure true
  action :nothing
end

package 'libapache2-mod-passenger' do
  action :install
end

execute 'enable passenger' do
  command 'sudo a2enmod rewrite'
end

execute 'sudo apache2ctl restart' do
  action :run
end

execute 'sudo a2enmod passenger' do
  action :run
end

execute 'sudo a2enmod ssl' do
  action :run
end
