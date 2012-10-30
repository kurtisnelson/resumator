$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'simplecov'
SimpleCov.start
require 'pry'
require 'rspec'
require 'resumator'

# Requires supporting files with custom matchers and macros, etc,
# in ./support/ and its subdirectories.
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f}
RESUMATOR_KEY = ENV['RESUMATOR_KEY']
RSpec.configure do |config|
  
end
