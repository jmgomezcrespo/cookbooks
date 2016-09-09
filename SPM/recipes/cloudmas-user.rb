user 'cloudmas' do
  comment 'CloudMas user'
  supports :manage_home => true
  home '/home/cloudmas'
  shell '/bin/bash'
  password '$1$MSdkGy5M$BNXRV8CqemNl171U8IPhi0'
  action :create
end

directory '/home/cloudmas/.ssh' do
  owner 'cloudmas'
  group 'cloudmas'
  mode '0700'
  action :create
end

cookbook_file '/home/cloudmas/.ssh/authorized_keys' do
  source 'cloudmas_auth_keys'
  mode '0600'
  owner 'cloudmas'
  group 'cloudmas'
end

bash 'cloudmas sudo' do
  code <<-EOH
    echo 'cloudmas ALL=(ALL) NOPASSWD:ALL' > /etc/sudoers.d/cloudmas
    EOH
end

