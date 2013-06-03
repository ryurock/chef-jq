#
# Cookbook Name:: jq
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

%w{autoconf automake flex bison gcc}.each do |pkg|
  package pkg do
    action :install
  end
end

git "/tmp/jq" do
  repository "https://github.com/stedolan/jq.git"
  reference "master"
  action :checkout
  user "root"
  group "rbenv"
end

# jqのインストール
execute "jq_install" do
  cwd "/tmp/jq"
  command "autoreconf; ./configure; make; make install"
  action :run
end

