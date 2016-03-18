# This is an autogenerated file. See readme.md.
require 'pandarus/model_base'

module Pandarus
  class UsageRights < ModelBase
    include Virtus.model(finalize: false)

    attribute :legal_copyright, resolve_type("String")
    attribute :use_justification, resolve_type("String")
    attribute :license, resolve_type("String")
    attribute :license_name, resolve_type("String")
    attribute :message, resolve_type("String")
    attribute :file_ids, resolve_type("Integer", collection: true)
    
  end
end

