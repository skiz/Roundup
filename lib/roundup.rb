require 'rubygems'
require 'bundler/setup'

require 'yaml'
require 'builder'
require 'rally_rest_api'
require 'active_support'

require 'roundup/exceptions'
require 'roundup/core'
require 'roundup/config'
require 'roundup/plugin'

config = YAML.load_file(File.join(File.dirname(__FILE__), '..', 'config','rally.yml'))
Dir[File.join(File.dirname(__FILE__), 'plugins') + '/*.rb'].each {|file| require file }

Roundup.setup do |opt|
  opt.base_url  = config['base_url']
  opt.username  = config['username']
  opt.password  = config['password']
  opt.project   = config['project']
  opt.workspace = config['workspace']
end

