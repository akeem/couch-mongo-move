require 'bundler/setup'
require 'rspec'

require_relative '../lib/couch_id_grabber'
require_relative '../lib/couch_mongo_importer'

RSpec.configure do |c|
   c.mock_with :rspec
end
