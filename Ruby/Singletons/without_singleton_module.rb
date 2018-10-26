# this class contains singleton implementation
# with using Singleton module
class Configuration
  attr_accessor :data

  def initialize
    @data = {}
  end

  def self.instance
    @@instance
  end

  def add(key, value)
    @data[key] = value
  end

  @@instance = Configuration.new

  private_class_method :new
end

# c = Configuration.new # this code will not work

# Global variable is used to store singleton
$c = Configuration.instance # 'instance' class method is used
puts $c.data