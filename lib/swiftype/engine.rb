module Swiftype
  class Engine < BaseModel
    def self.find(id)
      new Swiftype::Client.new.get("engines/#{id}.json")
    rescue
      nil
    end

    def build_document_type(params={})
      DocumentType.new({
        :engine_id => engine_id
      }.merge(params))
    end

    def create_document_type(params={})
      doc = build_document_type(params.merge(:engine_id => id))
      doc.create!
      doc
    end

    def document_types
      get("engines/#{slug}/document_types.json").map { |dt| DocumentType.new(dt) }
    end
  end
end
