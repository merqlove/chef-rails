#
# Cookbook Name:: rails
# Definition:: azure
#
# Copyright (C) 2017 Alexander Merkulov
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

node['rails']['drives'].each do |name, params|
  part_type = params['part_type'] || 'primary'
  file_system = params['file_system'] || 'xfs'
  children = params['children'] || false
  mkfs_name = "#{name}#{children ? 1 : ''}"
  force_format = params['force_format'] || false
  with_format = params['format'] || true
  label = params['label'] || 'loop'
  mount_point = params['mount_point'] || false

  mount_disk = mount(name) do
    device mkfs_name
    options 'defaults,nofail'
    fstype file_system
    action :nothing
  end

  mkfs = execute("mkfs.#{file_system} #{force_format ? '-f ' : ''}#{mkfs_name}") do
    action :nothing
    notifies :mount, mount_disk, :immediately if mount_point
    notifies :enable, mount_disk, :delayed if mount_point
    not_if { with_format }
  end

  execute "parted #{name} --script -- mklabel #{label} mkpart #{part_type} #{file_system} 1 -1s" do
    # Number  Start   End    Size   File system  Name  Flags
    #  1      17.4kB  537GB  537GB               xfs
    not_if "parted #{name} --script -- print |sed '1,/^Number/d' |grep #{part_type}"
    notifies :run, mkfs, :immediately
  end
end