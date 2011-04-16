class Roundup::Plugin::Search < Roundup::Plugin

  on_command "search", :search

  # searching requires the type to be provided
  # ex: defect, story
  def self.search(term)
    type = term.shift.to_sym
    type = :hierarchical_requirement if type == :story
    result =  Roundup.rally.find(type, 
      :fetch => true,
      :workspace => Roundup.workspace,
      :project => Roundup.project
    ){ contains :name, term.shift }
    
    pp result.map{|r| {
      :name => r.name, 
      :id => r.object_i_d,
      :state => r.state,
      :task_estimate_total => r.task_estimate_total,
      :task_remaining_total => r.task_remaining_total,
      :severity => r.severity,
      :blocked => r.blocked,
      :schedule_state => r.schedule_state,
      :owner => r.owner,
      :description => r.description,
      :resolution => r.resolution
    }}
  end

end
