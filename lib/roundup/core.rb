module Roundup  
  class << self
    attr_accessor :config, :rally, :workspace, :project

    def setup(*args)
      @config = Config.new
      yield @config if block_given?
      @rally = RallyRestAPI.new(@config.to_hash)
      configure_workspace(@config.workspace)
      configure_project(@config.project)
    rescue SystemCallError => e
      raise ConnectionError.new(e.message)
    end
    
    def process(args)
      cmd = Plugin.registered_commands[args.shift]
      eval(cmd[:klass]).send(cmd[:method], args) if cmd
    end

    protected
    
    def configure_workspace(name)
      @workspace = @rally.find(:workspace){ equal :name, name }.first
      raise InvalidWorkspaceError.new("Unable to find workspace: #{name}") unless @workspace
    end

    def configure_project(name)
      @project = @rally.find(:project){ equal :name, name }.first
      raise InvalidProjectError.new("Unable to find project: #{name}") unless @project
    end

  end
end

