# This is an autogenerated file. See readme.md.
require 'pandarus/model_base'

module Pandarus
  class Conference < ModelBase
    include Virtus.model(finalize: false)

    attribute :id, resolve_type("Integer")
    attribute :conference_type, resolve_type("String")
    attribute :conference_key, resolve_type("String")
    attribute :description, resolve_type("String")
    attribute :duration, resolve_type("Integer")
    attribute :ended_at, resolve_type("DateTime")
    attribute :started_at, resolve_type("DateTime")
    attribute :title, resolve_type("String")
    attribute :users, resolve_type("Integer", collection: true)
    attribute :has_advanced_settings, resolve_type(nil)
    attribute :long_running, resolve_type(nil)
    attribute :user_settings, resolve_type("Map")
    attribute :recordings, resolve_type("ConferenceRecording", collection: true)
    attribute :url, resolve_type("String")
    attribute :join_url, resolve_type("String")
    
  end
end
