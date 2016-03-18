# This is an autogenerated file. See readme.md.
require 'pandarus/model_base'

module Pandarus
  class Grader < ModelBase
    include Virtus.model(finalize: false)

    attribute :id, resolve_type("Integer")
    attribute :name, resolve_type("String")
    attribute :assignments, resolve_type("Integer", collection: true)
    
  end
end
