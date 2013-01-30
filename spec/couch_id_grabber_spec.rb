require 'spec_helper'


describe CouchIdGrabber do
  let(:id_uri){"http://localhost:5984/content-development/_design/RecipeService%3A%3ARecipe/_view/all"}
  subject{CouchIdGrabber.new(id_uri)}

  describe "#document_ids" do

    context "when uri is unreachable" do
      let(:id_uri){"http://localhost:5984/content-development/_design/does_not_exist/_view/all"}
      subject{CouchIdGrabber.new(id_uri)}

      it "should return an empty array" do
        subject.document_ids.should be_empty
      end
    end

    context "when uri does not return valid json" do
      xit "should raise an exception" do
        expect{subjec.document_ids}.to_raise Exception
      end
    end

    context "when uri contains 0 ids" do
      xit "should return an empty collection" do
        subject.document_ids.should be_empty
      end
    end

    context "when uri contains 1 or more ids" do
      it "should return a non-empty collection" do
        subject.document_ids.should_not be_empty
      end
    end
  end

end
