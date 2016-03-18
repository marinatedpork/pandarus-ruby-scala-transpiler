# This is an autogenerated file. See readme.md.
require 'pandarus/model_base'

module Pandarus
  class Feature < ModelBase
    include Virtus.model(finalize: false)

    attribute :name, resolve_type("String")
    attribute :display_name, resolve_type("String")
    attribute :applies_to, resolve_type("String")
    attribute :enable_at, resolve_type("DateTime")
    attribute :feature_flag, resolve_type("FeatureFlag")
    attribute :root_opt_in, resolve_type(nil)
    attribute :beta, resolve_type(nil)
    attribute :development, resolve_type(nil)
    attribute :release_notes_url, resolve_type("String")
    
  end
end
