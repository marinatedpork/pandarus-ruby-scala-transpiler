# This is an autogenerated file. See readme.md.
require 'pandarus/model_base'

module Pandarus
  class Folder < ModelBase
    include Virtus.model(finalize: false)

    attribute :context_type, resolve_type("String")
    attribute :context_id, resolve_type("Integer")
    attribute :files_count, resolve_type("Integer")
    attribute :position, resolve_type("Integer")
    attribute :updated_at, resolve_type("DateTime")
    attribute :folders_url, resolve_type("String")
    attribute :files_url, resolve_type("String")
    attribute :full_name, resolve_type("String")
    attribute :lock_at, resolve_type("DateTime")
    attribute :id, resolve_type("Integer")
    attribute :folders_count, resolve_type("Integer")
    attribute :name, resolve_type("String")
    attribute :parent_folder_id, resolve_type("Integer")
    attribute :created_at, resolve_type("DateTime")
    attribute :unlock_at, resolve_type("DateTime")
    attribute :hidden, resolve_type(nil)
    attribute :hidden_for_user, resolve_type(nil)
    attribute :locked, resolve_type(nil)
    attribute :locked_for_user, resolve_type(nil)
    
  end
end
