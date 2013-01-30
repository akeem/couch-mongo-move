require 'faraday'
require 'multi_json'

class CouchIdGrabber

  attr_accessor :id_uri

  def initialize id_uri
    @id_uri = id_uri
  end

  def document_ids
    begin
      response = Faraday.get @id_uri
      parsed_response = MultiJson.load(response.body)

      if parsed_response.has_key? "error"
        return []
      else
        return parsed_response["rows"].map{|item| item['id']}
      end
    rescue Exception => e
      return []
    end
  end

end
