$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'coveralls'
Coveralls.wear!
require 'pry'
require 'rspec'
require 'vcr'

require 'resumator'

# Requires supporting files with custom matchers and macros, etc,
# in ./support/ and its subdirectories.
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f}
ENV['RESUMATOR_TEST_KEY'] = "BxO624TAeatcdZfsugE45vNtiMpW28vJ" unless ENV['RESUMATOR_TEST_KEY']
VCR.configure do |c|
  c.cassette_library_dir = 'spec/fixtures/vcr_cassettes'
  c.hook_into :webmock # or :fakeweb
  c.filter_sensitive_data('<RESUMATOR_API_KEY>') { ENV['RESUMATOR_TEST_KEY'] }
end
RSpec.configure do |config|

end
