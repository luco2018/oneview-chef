#
# Cookbook Name:: oneview_test
# Recipe:: logical_switch_group_create
#
# (c) Copyright 2016 Hewlett Packard Enterprise Development LP
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software distributed
# under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR
# CONDITIONS OF ANY KIND, either express or implied. See the License for the
# specific language governing permissions and limitations under the License.
#

oneview_logical_switch_group 'LogicalSwitchGroup1' do
  client node['oneview_test']['client']
  switch_number 2
  switch_type 'Cisco Nexus 50xx'
end
