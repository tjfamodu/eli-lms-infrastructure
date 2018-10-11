#
# Cookbook:: ruby
# Recipe:: dependencies
#
# Copyright:: 2018, The Authors, All Rights Reserved.

package 'software-properties-common' do
  action :install
end

apt_repository 'ruby-ng' do
  uri 'ppa:brightbox/ruby-ng'
  components ['main']
  notifies :update, 'apt_update[Ruby PPA]', :immediately
  not_if 'ruby -v'
end

apt_update 'Ruby PPA' do
  ignore_failure true
  action :nothing
end
