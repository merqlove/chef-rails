#
# Cookbook Name:: rails
# Recipe:: openssl
#
# Copyright (C) 2014 Alexander Merkulov
#
# Licensed under the Apache License, Version 2.0 (the 'License');
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an 'AS IS' BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

::Chef::Recipe.send(:include, Rails::Helpers)

case node['platform_family']
when 'debian'
  include_recipe 'openssl::upgrade'
when 'rhel'
  if rhel5x?
    include_recipe 'openssl-fips'
  else
    include_recipe 'openssl::upgrade'
  end
end