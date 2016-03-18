# Any types that are not Boolean: QuizQuestion.points_possible

PATTERNS = {
	id:           /_id/,
	attribute:    /\s+attribute :/,
	_class:       /[\s]+class /,
	inherit_mark: / < /,
	resolve_type: /resolve_type\(/,
	comma:        /,/,
	integer:      /Integer/,
	float:        /Float/,
	string:       /String/,
	json:         /Map/,
	date_time:    /DateTime/,
	date:         /"Date"/,
	collection:   /", collection: true\)/,
	_nil:         /nil/,
	quote_paren:  /"\)/,
	any_n_quote:  /.+"/,
	ruby_file:    /\.rb/
}

class AbstractHash
	attr_reader :lines, :name, :attr_map

	def initialize(str)
		@lines = str.split("\n")
		@attr_map = map_attributes
		@name = get_class_name
	end

	private
	def map_attributes
		map = {}
		attribute_lines.each do |line|
			kv = property_name_and_type(attribute_blob(line))
			map[kv[:name]] = kv[:type]
		end
		map
	end

	def attribute_lines
		lines.select { |line| line =~ PATTERNS[:attribute]}		
	end

	def attribute_blob(line)
		line.gsub(PATTERNS[:attribute], "").gsub(PATTERNS[:resolve_type], "")
	end

	def property_name_and_type(blob)
		slicedex = ((blob =~ PATTERNS[:comma]))
		{name: get_property_name(blob[0..slicedex]), type: get_property_type(blob[slicedex..-1])}
	end

	def get_property_name(key)
		return key[-1] == "," ? key.chop : key
	end

	def get_property_type(blob)
		case blob
			when PATTERNS[:collection] then list_type(blob)
			when PATTERNS[:json]       then "JsObject"
			when PATTERNS[:integer]    then "Long"
			when PATTERNS[:float]      then "Double"
			when PATTERNS[:date_time]  then "DateTime"
			when PATTERNS[:date]       then "DateTime"
			when PATTERNS[:string]     then "String"
			when PATTERNS[:id]         then "Long"
			when PATTERNS[:_nil]       then "String"
			else object_type(blob)			
		end
	end

	def list_type(blob)
		type = blob.gsub(PATTERNS[:collection],"").gsub(PATTERNS[:any_n_quote],"")
		type = "Long" if type == "Integer"
		"List[#{type}]"
	end

	def object_type(blob)
		blob.gsub(PATTERNS[:quote_paren], "").gsub(PATTERNS[:any_n_quote], "")
	end

	def get_class_name
		if class_line.empty? || class_line.length > 1
			return "Error Finding Class Name"
		else
			return class_name[0].upcase + class_name[1..-1]
		end
	end

	def class_line
		lines.select { |line| line =~ PATTERNS[:_class] }
	end

	def class_name
		slicedex = (class_line.first =~ PATTERNS[:inherit_mark])
		class_line.first[0..slicedex].gsub(PATTERNS[:_class], "").strip
	end
end