user 'tyt' do
  comment 'tyt user'
  supports :manage_home => true
  uid '507'
  gid '507'
  home '/home/tyt'
  shell '/bin/bash'
  password '$1$8NUG0w47$II.7yAl4UUcUiCHc938Ff1'
  action :create
end

directory '/home/tyt/.ssh' do
  owner 'tyt'
  group 'tyt'
  mode '0700'
  action :create
end

cookbook_file '/home/tyt/.ssh/authorized_keys' do
  source 'tyt_auth_keys'
  mode '0600'
  owner 'tyt'
  group 'tyt'
end
