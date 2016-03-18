# This is an autogenerated file. See readme.md.
require 'pandarus/model_base'

module Pandarus
  class Migrator < ModelBase
    include Virtus.model(finalize: false)

    attribute :type, resolve_type("String")
    attribute :requires_file_upload, resolve_type(nil)
    attribute :name, resolve_type("String")
    attribute :required_settings, resolve_type("String", collection: true)
    
  end
end

