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

require_relative '../../../resource_provider'

module OneviewCookbook
  module API300
    module Synergy
      # Fabric API300 Synergy provider
      class FabricProvider < ResourceProvider
        def set_reserved_vlan_range
          @item.retrieve!
          options = { 'reservedVlanRange' => convert_keys(@context.reserved_vlan_range, :to_s) }
          options['reservedVlanRange']['type'] ||= 'vlan-pool'
          if @item.like? options
            Chef::Log.info("#{resource_name} '#{name}' reserved Vlan range is up to date")
          else
            Chef::Log.info "Set #{resource_name} '#{name}' reserved Vlan range"
            Chef::Log.debug "#{resource_name} '#{name}' Chef resource differs from OneView resource."
            Chef::Log.debug "Current state: #{JSON.pretty_generate(@item['reservedVlanRange'])}"
            Chef::Log.debug "Desired state: #{JSON.pretty_generate(options['reservedVlanRange'])}"
            diff = get_diff(@item, options)
            @context.converge_by "Set reserved Vlan range for #{resource_name} '#{name}'#{diff}" do
              @item.set_reserved_vlan_range(options['reservedVlanRange'])
            end
          end
        end
      end
    end
  end
end
