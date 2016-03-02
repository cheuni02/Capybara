require 'capybara'
require 'rack'
require 'selenium-webdriver'
require 'cucumber'
require 'require_all'
require 'rake'
require 'rest-client'
require 'rspec/expectations'
require 'pry'

URLS = "http://#{ENV['HOST']}"

ffprofile = Selenium::WebDriver::Firefox::Profile.new
# Disable Disk Caching in firefox because of problems with display on windows
ffprofile['browser.cache.disk.enable'] = false
ffprofile['browser.cache.disk.capacity'] = 0

# Firefox performance settings
ffprofile['network.http.pipelining'] = true
ffprofile['network.http.pipelining.maxrequests'] = 8
ffprofile['network.http.pipelining.aggressive'] = true
ffprofile['nglayout.initialpaint.delay'] = 0
ffprofile['browser.cache.use_new_backend'] = 1
ffprofile['network.prefetch-next'] = true
ffprofile['browser.tabs.animate'] = false
ffprofile['browser.display.show_image_placeholders'] = false
ffprofile['network.dns.disableIPv6'] = true
ffprofile['content.notify.backoffcount'] = 5
ffprofile['gfx.direct2d.disabled'] = true
ffprofile['layers.acceleration.disabled'] = true

require_all 'lib'


session = Capybara::Session.new(:selenium) #:firefox, profile: ffprofile

session.visit URLS

class CustomWorld
  class << self
    attr_accessor(:session)
  end

  def site
    site = VWBase.new(CustomWorld.session)
  end
end

CustomWorld.session = session

World do
  CustomWorld.new
end
