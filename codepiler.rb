require 'fileutils'
require_relative 'file-mapper.rb'
require_relative 'json-formats-writer.rb'
require_relative 'case-class-writer.rb'
require_relative 'companion-object-writer.rb'
require_relative 'file-helper.rb'

class Codepiler

	include FileHelper

	def initialize
		compile
	end

	def compile
		compiled_names = files.map do |path|
			puts "[Parsing]: #{path}"
			file_string = File.open(path).read
			model_hash  = AbstractHash.new(file_string)
			json_format = JSONFormatParser.new(model_hash).json_def
			companion_object = CompanionObjectWriter.to_companion_object(model_hash, json_format)
			case_class  = CaseClassWriter.new(model_hash).case_class
			model = case_class + "\n" + companion_object
			file_empty("scala/#{model_hash.name}.scala")
			file_preppend("scala/#{model_hash.name}.scala", CompanionObjectWriter.imports)
			file_append("scala/#{model_hash.name}.scala", model)
			model_hash.name
		end
		success_message(compiled_names.length)
	end

	def success_message(count)
		puts "\nSuccessfully wrote #{count} Case Classes, JSON Readers, and JSON Writers.\n"
	end

	def files
		path = "/ruby/"
		entries = Dir.entries(Dir.pwd + path).select do |e|
			e =~ PATTERNS[:ruby_file]
		end
		entries.map { |e| Dir.pwd + path + e }
	end

end

Codepiler.new
puts "$$$.\n\n"
