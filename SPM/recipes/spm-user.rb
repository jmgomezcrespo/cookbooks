#[ "web20min", "esquire", "forbes"].each do |userspm|
{
  "web20min" => "502",
  "esquire" => "505",
  "forbes" => "506"
}.each do |userspm, id|
  group "#{userspm}" do
    gid "#{id}"
    action :create
  end
  user "#{userspm}" do
    comment "#{userspm} user"
    supports :manage_home => true
    uid "#{id}"
    gid "#{id}"
    home "/home/#{userspm}"
    shell '/bin/bash'
    password '$1$8NUG0w47$II.7yAl4UUcUiCHc938Ff1'
    action :create
  end
end
