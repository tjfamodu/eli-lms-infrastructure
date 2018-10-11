#
# Cookbook:: canvas
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

templates = [
    'amazon_s3',
    'database',
    'delayed_jobs',
    'domain',
    'external_migration',
    'file_store',
    'outgoing_mail',
    'security'
]

templates.each do |template|
    template "/var/canvas/config/#{template}.yml" do
      source "#{template}.yml"
      owner 'canvasuser'
      mode '0400'
      action :create
    end
end
