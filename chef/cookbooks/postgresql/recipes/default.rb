#
# Cookbook:: postgres
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

postgresql_server_install 'My PostgreSQL Server install' do
  action :install
end

postgresql_server_install 'Setup my PostgreSQL 9.5 server' do
  password 'MyP4ssw0d'
  port 5432
  action :create
end

find_resource(:service, 'postgresql') do
  extend PostgresqlCookbook::Helpers
  service_name lazy { platform_service_name }
  supports restart: true, status: true, reload: true
  action [:enable, :start]
end

# postgresql_server_conf 'PostgreSQL Config' do
#   notifies :reload, service['postgresql']
# end
