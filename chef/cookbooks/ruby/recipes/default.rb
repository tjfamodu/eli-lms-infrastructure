#
# Cookbook:: ruby
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

include_recipe 'ruby::dependencies'

package %w(ruby2.4 ruby2.4-dev zlib1g-dev libxml2-dev libsqlite3-dev postgresql libpq-dev libxmlsec1-dev curl make g++) do
  action :install
end

include_recipe 'ruby::gems'