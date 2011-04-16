module Roundup
  class Plugin
    
    @registered_plugins  = []
    @registered_commands = {}

    class << self
      attr_reader :registered_plugins, :registered_commands

      def inherited(child)
        Plugin.registered_plugins << child
      end

      def on_command(command, *methods)
        methods.each do |method|
          Plugin.registered_commands[command] = {:klass => self.to_s, :method => method}
        end
      end

    end
  end
end

