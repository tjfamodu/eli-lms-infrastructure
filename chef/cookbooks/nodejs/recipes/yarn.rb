execute 'Pull Yarn Key' do
  command 'curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -'
  action :run
end

execute 'Add Yarn to package list' do
  command 'echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list'
  action :run
  notifies :update, 'apt_update[yarn update]', :immediately
end

apt_package 'yarn' do
  action :install
end

execute 'Run yarn install' do
  command 'cd /var/canvas && yarn install'
  action :run
end

apt_update 'yarn update' do
  ignore_failure true
  action :nothing
end
