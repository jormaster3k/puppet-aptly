# frozen_string_literal: true

require 'rspec-system/spec_helper'
require 'rspec-system-puppet/helpers'

include RSpecSystemPuppet::Helpers

RSpec.configure do |c|
  proj_root = File.expand_path(File.join(File.dirname(__FILE__), '..'))
  c.tty = true
  c.include RSpecSystemPuppet::Helpers

  c.before :suite do
    puppet_install
    puppet_module_install(source: proj_root, module_name: 'aptly')
    shell('puppet module install puppetlabs-stdlib')
    shell('puppet module install puppetlabs-apt --version 2.2.0')
  end
end
