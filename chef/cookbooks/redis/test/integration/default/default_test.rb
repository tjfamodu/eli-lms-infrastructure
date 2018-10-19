# # encoding: utf-8

# Inspec test for recipe redis::default

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

describe package ('redis') do
  it { should be_installed }
  it { should be_enabled }
  it ( should be_running )
  its('version') { should cmp >= '2.6'}
end
