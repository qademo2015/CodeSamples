###########################################################
# this file contains different implementations for reading
# data from *.yaml file (e.g. with environment configs)
###########################################################

require 'yaml'

def read_config_yaml(filename, env)
  config = YAML.load_file filename
  config[env] if config.keys.include?(env)
end

filename = 'data_file.yml'
env = 'qa'
puts read_config_yaml(filename, env)
