# This script implements basic Selenium test
#
# Author: Alexey Smirnov
#
# Requirements: Ruby v2.2+, 'selenium-webdriver' gem, Firefox

require 'rubygems'
require 'selenium-webdriver'
require 'rspec'
# require 'nokogiri'
# require 'test-unit'

# class ExampleTestCase < Test::Unit::TestCase
#
# end

url = 'https://google.com'

# creating 'driver' instance and set implicit wait
driver = Selenium::WebDriver.for :firefox
wait = Selenium::WebDriver::Wait.new(timeout: 15)
driver.manage.timeouts.implicit_wait = 10

# navigate to particular page (method also waits until page is fully loaded)
driver.get(url)

# actions and assertions
search_pattern = 'International Space Station'
link_pattern = search_pattern.tr(' ', '_')
wait.until do
  el = driver.find_element(name: 'q')
  el if el.displayed?
  el.send_keys(search_pattern)
end
driver.action.send_keys(:enter).perform
sleep 3
links = []
driver.find_elements(tag_name: 'a').each do |elem|
  links << elem.attribute('href')
end
flag = links.any? { |link| link.include?(link_pattern) unless link.nil? }
puts flag
# assert(flag)

# links.each do |link|
#   puts link
# end

content = driver.page_source
# doc = Nokogiri::HTML(content)



