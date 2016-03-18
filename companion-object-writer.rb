require_relative 'canvas-helper.rb'

class CompanionObjectWriter
	def self.to_companion_object(abstr_hash, json_format)
		obj = "object #{abstr_hash.name} {\n"
		obj << json_format
		obj << "\n}"
	end

	def self.imports
		"package models

import play.api.Logger
import play.api.Play.current

import play.api.libs.json._
import play.api.libs.functional.syntax._
import play.api.libs.concurrent.Execution.Implicits.defaultContext

import org.joda.time.DateTime
import org.joda.time.DateTimeZone.UTC"
	end
end
