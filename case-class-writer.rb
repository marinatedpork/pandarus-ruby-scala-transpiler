require_relative 'canvas-helper.rb'

TWO_SPACES = "  "
CASE_LINE_LENGTH = 40
MAX_LINE_PARAM = 21

class CaseClassWriter
	include CanvasHelper
	attr_reader :case_class

	def initialize(abstr_hash)
		@case_class = to_case_class(abstr_hash)
	end

	private
	def to_case_class(abstr_hash)
		start = "case class #{abstr_hash.name}("
		ending = ")"
		values = get_vals(abstr_hash)
		lines = get_lines(abstr_hash, values)
		raw = lines.unshift(start) << ending
		raw.join("\n") + "\n"
	end

	def get_vals(abstr_hash)
		values = abstr_hash.attr_map.values
		values.map.with_index do |type, i|
			line = ": Option[#{type}]"
			line += "," unless i == values.length - 1
			line = line.gsub(/,/, "") if i == (MAX_LINE_PARAM - 1)
			line
		end
	end

	def get_lines(abstr_hash, values)
		abstr_hash.attr_map.keys.map.with_index do |key, i|
			clean_key = clean(key)
			line_diff = (CASE_LINE_LENGTH - clean_key.length)
			space = empty_space(line_diff)
			make_line(clean_key, space, values[i], i)
		end
	end

	def make_line(key, space, value, index)
		if index < MAX_LINE_PARAM
			TWO_SPACES + key + space + value
		else
			TWO_SPACES + "//" + key + space + value
		end
	end
end