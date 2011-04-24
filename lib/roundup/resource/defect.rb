module Roundup
  class Defect < Resource::Base 
    attributes :accepted_date, :affects_doc, :attachments, :blocked, :blocker, :closed_date, :duplicates,
      :environment, :fixed_in_build, :found_in_build, :iteration, :opened_date, :package, :plan_estimate,
      :priority, :rank, :release, :release_note, :requirement, :resolution, :salesforce_case_id, 
      :salesforce_case_number, :schedule_state, :severity, :state, :submitted_by, :target_build, :target_date,
      :task_actual_total, :task_estimate_total, :task_remaining_total, :task_status, :tasks, :test_case,
      :test_case_result, :test_case_status, :test_cases, :verified_in_build
  end
end
