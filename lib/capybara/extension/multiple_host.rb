# Capybara - Multiple host extension
#
# This extension will allow you to set the domain for the next request
# by using +host!+ method in Cucumber step definition.

module Capybara::Extension
  module MultipleHost
    def host!(new_host = nil)
      new_host = "http://#{new_host}" if new_host
      page.driver.current_host = new_host
    end
  end
end

module Capybara
  include Capybara::Extension::MultipleHost
end
