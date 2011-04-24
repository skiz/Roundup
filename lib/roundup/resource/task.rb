module Roundup
  class Task < Resource::Base
    attributes :actuals, :attachments, :blocked, :estimate, :iteration, :project, :rank, :release, :state,
      :task_index, :to_do, :work_product
  end
end
