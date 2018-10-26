require 'singleton'

# this class contains singleton implementation
# with using Singleton module
class Configuration
  include Singleton

  attr_accessor :data

  def initialize
    @data = {}
  end

  def add(key, value)
    @data[key] = value
  end

  def version
    '0.0.1'
  end
end

# c = Configuration.new # this code will not work

# Global variable is used to store singleton
$c = Configuration.instance # 'instance' class method is used
puts $c.data