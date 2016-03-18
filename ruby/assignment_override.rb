# This is an autogenerated file. See readme.md.
require 'pandarus/model_base'

module Pandarus
  class AssignmentOverride < ModelBase
    include Virtus.model(finalize: false)

    attribute :id, resolve_type("Integer")
    attribute :assignment_id, resolve_type("Integer")
    attribute :student_ids, resolve_type("Integer", collection: true)
    attribute :group_id, resolve_type("Integer")
    attribute :course_section_id, resolve_type("Integer")
    attribute :title, resolve_type("String")
    attribute :due_at, resolve_type("DateTime")
    attribute :all_day, resolve_type("Integer")
    attribute :all_day_date, resolve_type("DateTime")
    attribute :unlock_at, resolve_type("DateTime")
    attribute :lock_at, resolve_type("DateTime")
    
  end
end
