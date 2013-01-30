require 'spec_helper'

describe CouchMongoImporter do

  subject{CouchMongoImporter.new(:host => "http://localhost:5984", :database => "content-development")}
  let(:mongo_db){
    c = Mongo::Connection.new
    db = c['couchdb_imported']
    coll = db['content-development']
    coll
  }

  describe "#import_record" do
    it "should create a matching record in mongodb" do
      subject.import_record("f412bf2c06c5eb7f2523005c2d190ab1")
      mongo_db.find_one({"_id" => "f412bf2c06c5eb7f2523005c2d190ab1"}).should_not be_nil
    end
  end

end
