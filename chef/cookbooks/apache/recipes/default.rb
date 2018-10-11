#
# Cookbook:: apache
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

include_recipe 'apache::passenger'
include_recipe 'apache::virtualhosts'
