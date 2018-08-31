# This script implements basic Selenium test
#
# Author: Alexey Smirnov
#
# Requirements: Ruby v2.2+, 'selenium-webdriver' gem, Firefox

require 'rubygems'
require 'selenium-webdriver'
require 'rspec'
# require 'test-unit'

# class ExampleTestCase < Test::Unit::TestCase
#
# end

url = 'https://google.com'

# creating 'driver' instance and set implicit wait
driver = Selenium::WebDriver.for :firefox
driver.manage.timeouts.implicit_wait = 10

# navigate to particular page (method also waits until page is fully loaded)
driver.get(url)

# assertions and actions


