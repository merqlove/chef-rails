#
# Cookbook Name:: rails
# Recipe:: default
#
# Copyright (C) 2013 Alexander Merkulov
# 
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# 
#    http://www.apache.org/licenses/LICENSE-2.0
# 
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

include_recipe "rails::rbenv"

directory node['rails']['base_path'] do
  mode      '0755'
  owner     node['rails']['user']['deploy']
  group     node['rails']['user']['deploy']
  action    :create
  recursive true
end

# node['rails']['apps']['production'].each do |path|
#   directory "#{node['rails']['path']}/#{path}" do
#     owner node['rails']['user']['main']
#     group node['rails']['user']['main']
#     mode "0755"
#     action :create
#     recursive true
#   end
# end