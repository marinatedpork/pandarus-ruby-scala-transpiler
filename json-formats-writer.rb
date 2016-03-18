require_relative 'canvas-helper.rb'

LINE_LENGTH_FORMATS = 90
MAX_LINE_PARAM = 21

class JSONFormatParser
	include CanvasHelper
	attr_reader :name, :json_def

	def initialize(abstr_hash)
		@name = abstr_hash.name
		@json_def = to_json_format(abstr_hash)
	end

	private
	def to_json_format(abstr_hash)
		if abstr_hash.attr_map.length == 1
			single_attr_format(abstr_hash)
		else
			many_attr_format(abstr_hash)
		end
	end

	def single_attr_format(abstr_hash)
		prop = abstr_hash.attr_map.first[0]
		type = abstr_hash.attr_map.first[1]
		reader = single_attr_reader(prop, type)
		writer = single_attr_writer(prop)
		reader + "\n" + writer
	end

	def single_attr_reader(prop, type)
		"\n  implicit val #{turtle_case(name)} : Reads[#{name}] = (__ \\ '#{prop}).readNullable[#{type}].map(#{name}(_))\n"
	end

	def single_attr_writer(prop)
		method_string   = "  implicit val #{turtle_case(name)}Writes = new Writes[#{name}] {"
		method_string  += "\n    def writes(#{turtle_case(name)}:#{name}) : JsObject = Json.obj("
		body_start      = "\n      \"#{prop}\""
		line_diff       = (LINE_LENGTH_FORMATS - body_start.length)
		method_string  += body_start
    method_string  += empty_space(line_diff)
    method_string  += " -> #{turtle_case(name)}.#{clean(prop)}"
		method_string  += "\n    )\n  }"
	end

	def many_attr_format(abstr_hash)
		start = "  implicit val #{turtle_case(name)}Format : Format[#{name}] = ("
		ending = "  )(#{name}.apply, unlift(#{name}.unapply))"
		raw = get_pathing(abstr_hash).unshift(start) << ending
		raw.join("\n")
	end

	def get_pathing(abstr_hash)
		abstr_hash.attr_map.map.with_index do |(prop, type), i|
			line = make_line(prop, type, i)
			line_diff = (LINE_LENGTH_FORMATS - line.length)
			line += empty_space(line_diff)
			line += "and" unless i == abstr_hash.attr_map.length - 1 
			line = line.gsub(/\s+and/, "") if i == (MAX_LINE_PARAM - 1)
			line
		end
	end

	def make_line(prop, type, index)
		if type == name
			recursive_prop(prop, index)
		else
			reg_prop(prop, type, index)
		end
	end

	def recursive_prop(prop, index)
		if index < MAX_LINE_PARAM
			"    (JsPath \\ \"#{prop}\").lazyFormatNullable(#{turtle_case(name)}Format)"
		else
			"    //(JsPath \\ \"#{prop}\").lazyFormatNullable(#{turtle_case(name)}Format)"
		end
	end

	def reg_prop(prop, type, index)
		if index < MAX_LINE_PARAM
				"    (JsPath \\ \"#{prop}\").formatNullable[#{type}]"
		else
				"    //(JsPath \\ \"#{prop}\").formatNullable[#{type}]"
		end
	end
end