# This is an autogenerated file. See readme.md.
require 'pandarus/model_base'

module Pandarus
  class SubmissionHistory < ModelBase
    include Virtus.model(finalize: false)

    attribute :submission_id, resolve_type("Integer")
    attribute :versions, resolve_type("Integer", collection: true)
    
  end
end
