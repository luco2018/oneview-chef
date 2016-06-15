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

client = {
  url: '',
  user: '',
  password: '',
  ssl_enabled: false
}

oneview_storage_pool 'CPG_FC-AO' do
  storage_system 'ThreePAR7200-8147'
  client client
  action :add
end

oneview_storage_pool 'CPG_FC-AO' do
  client client
  action :remove
end
