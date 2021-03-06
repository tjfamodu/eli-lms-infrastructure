#
# Cookbook:: assets
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

# user 'canvasuser' do
#   shell '/bin/bash'
#   action :create
# end
#
# group 'canva' do
#   action :create
#   members 'canvasuser'
# end
#
# directory 'var/canvas' do
#   owner 'canvasuser'
#   action :create
#   recursive true
# end

%w{log tmp/pids public/assets app/stylesheets/brandable_css_brands}.each do |dir|
  directory "/var/canvas/#{dir}" do
    owner 'ubuntu'
    group 'www-data'
    mode '0755'
    action :create
    recursive true
  end
end

%w{app/stylesheets/_brandable_variables_defaults_autogenerated.scss Gemfile.lock log/production.log}.each do |fil|
  file "/var/canvas/#{fil}" do
    owner 'ubuntu'
    group 'www-data'
    mode '0755'
    action :create
  end
end
