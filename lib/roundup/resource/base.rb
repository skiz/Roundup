module Roundup
  module Resource
    # All mapped resources extend Resource::Base. These resources
    # represent the remote objects and should provide associate
    # methods which allow retrieving and managing a related resource.
    class Base

      def initialize(attributes)
        attributes.map{|k,v| self.send(:"#{k}=", v) }
      end

      def self.attributes(*args)
        (@attributes ||= []).concat(args)
        attr_accessor(*args)
      end

      def self.find(&block)
        Roundup.rally.find(self.name.underscore.to_sym){ yield if block_given? }
      end
    end
  end
end
