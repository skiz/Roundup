module Roundup
  # Roundup plugins use a simple architecture to register class methods within plugins
  # that have been loaded. All functionality provided by Roundup is via custom plugins.  
  class Plugin
    
    @registered_plugins  = []
    @registered_commands = {}

    class << self
      attr_reader :registered_plugins, :registered_commands

      def inherited(child) #:nodoc:
        Plugin.registered_plugins << child
      end

      # To register a class mehod within in the plugin, you need to call +register_command+
      # This references the class and method which will be triggered when the command is
      # called.
      def register_command(command, *methods)
        methods.each do |method|
          Plugin.registered_commands[command] = {:klass => self.to_s, :method => method}
        end
      end

    end
  end
end

