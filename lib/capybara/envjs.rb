require 'capybara'
require 'capybara/driver/envjs_driver'
require 'capybara/extension/multiple_host'
require 'capybara/extension/rack_test_methods_default_domain'

if Object.const_defined? :Cucumber
  require 'capybara/envjs/cucumber'
end
