ENV["RAILS_ENV"] = "test"
DEVISE_ORM = (ENV["DEVISE_ORM"] || :active_record).to_sym

$:.unshift File.dirname(__FILE__)
puts "\n==> Devise.orm = #{DEVISE_ORM.inspect}"
require "rails_app/config/environment"
require 'rails/test_help'
require "orm/#{DEVISE_ORM}"
require 'capybara/rails'
require 'mocha/setup'

ActionMailer::Base.delivery_method = :test
ActionMailer::Base.perform_deliveries = true
ActionMailer::Base.default_url_options[:host] = 'test.com'

ActiveSupport::Deprecation.silenced = true
$VERBOSE = false

class ActionDispatch::IntegrationTest
  include Capybara::DSL
end
class ActionController::TestCase
  include Devise::TestHelpers
end
