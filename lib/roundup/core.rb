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
      raise InvalidWorkspaceException.new("Unable to find workspace: #{name}") unless @workspace
    end

    def configure_project(name)
      @project = @rally.find(:project){ equal :name, name }.first
      raise InvalidProjectException.new("Unable to find project: #{name}") unless @project
    end

  end
  
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

