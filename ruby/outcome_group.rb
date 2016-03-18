# This is an autogenerated file. See readme.md.
require 'pandarus/model_base'

module Pandarus
  class OutcomeGroup < ModelBase
    include Virtus.model(finalize: false)

    attribute :id, resolve_type("Integer")
    attribute :url, resolve_type("String")
    attribute :parent_outcome_group, resolve_type("OutcomeGroup")
    attribute :context_id, resolve_type("Integer")
    attribute :context_type, resolve_type("String")
    attribute :title, resolve_type("String")
    attribute :description, resolve_type("String")
    attribute :vendor_guid, resolve_type("String")
    attribute :subgroups_url, resolve_type("String")
    attribute :outcomes_url, resolve_type("String")
    attribute :import_url, resolve_type("String")
    attribute :can_edit, resolve_type(nil)
    
  end
end

