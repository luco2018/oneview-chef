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

module OneviewCookbook
  # Module for Oneview API 200 Resources
  module API300
    SUPPORTED_VARIANTS = %w(C7000 Synergy).freeze

    # Get resource class that matches the type given
    # @param [String] type Name of the desired class type
    # @param [String] variant Variant (C7000 or Synergy)
    # @return [Class] Resource class or nil if not found
    def self.resource_named(type, variant)
      raise "API300 variant #{variant} is not supported!" unless SUPPORTED_VARIANTS.include?(variant.to_s)
      new_type = type.to_s.downcase.gsub(/[ -_]/, '')
      api_module = OneviewCookbook::API300.const_get(variant.to_s)
      api_module.constants.each do |c|
        klass = api_module.const_get(c)
        next unless klass.is_a?(Class) # && klass < OneviewCookbook::ResourceProvider
        name = klass.name.split('::').last.downcase.delete('_').delete('-')
        return klass if new_type =~ /^#{name}$/
      end
      raise "The '#{type}' resource does not exist for API version 300, variant #{variant}."
    end
  end
end

# Load all API-specific resources:
Dir[File.dirname(__FILE__) + '/api300/*.rb'].each { |file| require file }
