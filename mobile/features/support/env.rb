require 'appium_lib'
require 'pry'

caps_path = File.join(File.dirname(__FILE__), '..', '..', 'caps', ENV['PLATFORM'], "#{ENV['CAPS']}.txt")

caps = Appium.load_appium_txt file: caps_path, verbose: true

Appium::Driver.new(caps, true)
$driver.start_driver

if ENV['PLATFORM'] == 'android'
  $driver.remove_app caps[:caps][:appPackage]
end

class AppiumWorld
end

Appium.promote_appium_methods AppiumWorld

World do
  AppiumWorld.new
end

Before do
  $driver.start_driver
  $driver.launch_app
  @m_Object = Utils.new
end

# After do |scenario|
#   filename = scenario.name.tr(' ', '_').downcase!
#   filename = filename.gsub(/([_@#!%()\-=;><,{}\~\[\]\.\/\?\"\*\^\$\+\-]+)/, '')
#   screenshot = "log/screenshot/#{filename}.png"
#   $driver.screenshot screenshot
#   embed(screenshot, 'image/png', 'Show screenshot')
#   $driver.driver_quit
# end