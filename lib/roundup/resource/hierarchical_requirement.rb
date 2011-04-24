module Roundup
  class HierarchicalRequirement < Resource::Base
    attributes :package, :accepted_date, :blocked, :blocker, :children, :defect_status, :defects, 
      :iteration, :parent, :plan_estimate, :predecessors, :rank, :release, :schedule_state, :successors
      :task_actual_total, :task_estimate_total, :task_remaining_total, :task_status, :tasks, :test_case_status,
      :test_cases
  end
end
