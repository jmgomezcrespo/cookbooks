#
# Cookbook Name:: TandT
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
#
include_recipe 'php'
#include_recipe 'php::package'
include_recipe 'php::module_mysql'
include_recipe 'yum-mysql-community::mysql56'
include_recipe 'php-fpm'

httpd_service 'default' do
  action [:create, :start]
end

httpd_module 'php' do
  action :create
end

mysql_service 'foo' do
  port '3306'
  version '5.6'
  initial_root_password 'test123'
  action [:create, :start]
end
