require 'spec_helper'

describe CouchIdGrabber do
  let(:id_uri){"http://localhost:5984/content-development/_design/RecipeService%3A%3ARecipe/_view/all"}
  subject{CouchIdGrabber.new(id_uri)}

  describe "#document_ids" do

    context "when uri is unreachable" do
      it "should return an empty array"
    end

    context "when uri does not return valid json" do
      it "should raise an exception"
    end

    context "when uri contains 0 ids" do
      it "should return an empty collection"
    end

    context "when uri contains 1 or more ids" do
      it "should return a non-empty collection"
    end
  end

end
