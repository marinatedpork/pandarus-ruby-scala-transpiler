# This is an autogenerated file. See readme.md.
require 'pandarus/model_base'

module Pandarus
  class OutcomeLink < ModelBase
    include Virtus.model(finalize: false)

    attribute :url, resolve_type("String")
    attribute :context_id, resolve_type("Integer")
    attribute :context_type, resolve_type("String")
    attribute :outcome_group, resolve_type("OutcomeGroup")
    attribute :outcome, resolve_type("Outcome")
    
  end
end

