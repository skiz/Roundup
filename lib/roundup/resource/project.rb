module Roundup
  class Project < Resource::Base
    attributes :build_definitions, :children, :description, :iterations, :name, :notes, :owner, :parent, :releases,
      :state, :team_members
  end
end
