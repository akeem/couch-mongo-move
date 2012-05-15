require 'bundler/setup'
require 'rspec'

require_relative '../lib/couch_id_grabber'

RSpec.configure do |c|
   c.mock_with :rspec
end
