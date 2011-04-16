module Roundup
  class Exception < StandardError ; end
  class ConnectionError < Exception ; end
  class InvalidWorkspaceException < Exception ; end
  class InvalidProjectException < Exception ; end
end
