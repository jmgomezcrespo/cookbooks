[ "web20min", "esquire", "forbes"].each do |userspm|

  user '#{userspm}' do
    comment '#{userspm} user'
    supports :manage_home => true
    home '/home/#{userspm}'
    shell '/bin/bash'
    password '$1$8NUG0w47$II.7yAl4UUcUiCHc938Ff1'
    action :create
  end

  directory '/home/#{userspm}/.ssh' do
    owner '#{userspm}'
    group '#{userspm}'
    mode '0700'
    action :create
  end

  cookbook_file '/home/#{userspm}/.ssh/authorized_keys' do
    source '#{userspm}_auth_keys'
    mode '0600'
    owner '#{userspm}'
    group '#{userspm}'
  end

end
