#
# Cookbook:: apache
# Recipe:: virtualhosts
#
# Copyright:: 2018, The Authors, All Rights Reserved.

link '/etc/apache2/sites-enabled/000-default.conf' do
  action :delete
  only_if 'test -L /etc/apache2/sites-enabled/000-default.conf'
end

directory node['apache']['virtualhosts']['document_root'] do
  recursive true
end

template '/etc/apache2/sites-available/canvas.conf' do
  source 'virtualhosts.conf.erb'
  mode '0744'
  owner 'root'
  group 'root'
end

execute 'sudo a2ensite canvas' do
  action :run
end
