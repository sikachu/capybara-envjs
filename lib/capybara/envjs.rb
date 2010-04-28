require 'capybara'
require 'capybara/driver/envjs_driver'
require 'capybara/extension/multiple_host'

if Object.const_defined? :Cucumber
  require 'capybara/envjs/cucumber'
end
