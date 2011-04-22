module Roundup
  class Config

    def self.options(*vars)
      (@attributes ||= []).concat vars
      attr_accessor(*vars)
    end

    def self.attributes
      @attributes
    end
    
    def attributes
      self.class.attributes
    end

    def to_hash
      attributes.inject({}) do |results, obj|
        results[obj] = self.send(obj)
        results
      end.reject{|k, v| v.nil? }
    end
    
    options :base_url, :workspace, :username, :password, :project, :logger, :version, :builder
  end
end 
