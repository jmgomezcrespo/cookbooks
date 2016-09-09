instance = search("aws_opsworks_instance", "self:true").first
layer = search("aws_opsworks_layer", "layer_id:#{instance['layer_ids'][0]}").first

if layer['name'].match('front')
  sensu_suscriptions = 'http'
else
  sensu_suscriptions = nil
end

template '/home/cloudmas/userdata.sh' do
  source 'userdata.sh.erb'
  owner 'root'
  group 'root'
  mode '0755'
  variables ({
    :environment => "#{node['vandal']['environment']}",
    :layer => "#{layer['name']}",
    :suscriptions_groups => "#{sensu_suscriptions}"
  })
  action :create
end

bash 'Install Sensu client' do
  cwd '/home/cloudmas/'
  code <<-EOH
    ./userdata.sh
    EOH
  ignore_failure true
end
