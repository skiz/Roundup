module Roundup

  # Custom exception class that provides Roundup::Error specific errors.
  class Error < StandardError ; end

  # When Roundup is unable to connect to Rally, a ConnectionError is raised.
  class ConnectionError < Error ; end

  # When Rounup is unable to reference a valid workspace, InvalidWorkspaceError is raised.
  class InvalidWorkspaceError < Error ; end

  # When Roundup is unable to reference a valid project, InvalidProjectError is raised.
  class InvalidProjectError < Error ; end
end
