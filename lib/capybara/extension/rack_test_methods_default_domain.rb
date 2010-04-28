require 'rack/test'

# Capybara - Rack::Test::Methods Default Domain Extension
#
# This extension will override +Rack::Test::Methods#build_rack_mock_session+
# to make it honor the +app_host+ you set in the configuration file or in
# environment variable.

module Capybara::Extension
  module RackTestMethodsDefaultDomain
    def self.included(base)
      base.class_eval do
        alias_method :build_rack_mock_session_without_domain, :build_rack_mock_session
        alias_method :build_rack_mock_session, :build_rack_mock_session_with_domain
      end
    end

    def build_rack_mock_session_with_domain
      Rack::MockSession.new app, (ENV["CAPYBARA_APP_HOST"] || Capybara.app_host || "http://example.org").sub(/^http:\/\//, '')
    end
  end
end

module Rack::Test::Methods
  include Capybara::Extension::RackTestMethodsDefaultDomain
end
