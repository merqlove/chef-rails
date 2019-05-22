#
# Cookbook Name:: rails
# Recipe:: python
#
# Copyright (C) 2018 Alexander Merkulov
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

python_runtime 'system' do
  get_pip_url node['rails']['python']['pip_url']
  pip_version node['rails']['python']['pip_version']

  provider :system
  version node['rails']['python']['version']
  options dev_package: node['rails']['python']['dev_package']
end