require 'faraday'
require 'faraday_middleware'
require 'mongo'

class CouchMongoImporter

  def initialize settings
    @couch_host = settings[:host]
    @couch_database = settings[:database]

    @mongo_connection = Mongo::Connection.new
    @db   = @mongo_connection['couchdb_imported']
    @coll = @db[@couch_database]

    @couch_connection = Faraday.new(:url => @couch_host) do |builder|
      builder.request  :url_encoded
      builder.adapter  :net_http

      builder.response :json#, :content_type => /\bjson$/
    end

  end

  def import_record record_id
    response = @couch_connection.get "/#{@couch_database}/#{record_id}"
    @coll.insert response.body
  end

end
