# This is an autogenerated file. See readme.md.
require 'pandarus/model_base'

module Pandarus
  class Answer < ModelBase
    include Virtus.model(finalize: false)

    attribute :id, resolve_type(nil)
    attribute :answer_text, resolve_type("String")
    attribute :answer_weight, resolve_type(nil)
    attribute :answer_comments, resolve_type("String")
    attribute :text_after_answers, resolve_type("String")
    attribute :answer_match_left, resolve_type("String")
    attribute :answer_match_right, resolve_type("String")
    attribute :matching_answer_incorrect_matches, resolve_type("String")
    attribute :numerical_answer_type, resolve_type("String")
    attribute :exact, resolve_type(nil)
    attribute :margin, resolve_type(nil)
    attribute :start, resolve_type(nil)
    attribute :end, resolve_type(nil)
    attribute :blank_id, resolve_type(nil)
    
  end
end

