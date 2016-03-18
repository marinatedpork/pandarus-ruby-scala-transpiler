# This is an autogenerated file. See readme.md.
require 'pandarus/model_base'

module Pandarus
  class SisImportData < ModelBase
    include Virtus.model(finalize: false)

    attribute :import_type, resolve_type("String")
    attribute :supplied_batches, resolve_type("String", collection: true)
    attribute :counts, resolve_type("SisImportCounts")
    
  end
end

