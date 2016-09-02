#
# Cookbook Name:: TandT
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

include_recipe 'TandT::cloudmas-user'

cookbook_file '/var/spool/cron/root' do
  source 'crontab-tyt'
  mode '0600'
end
