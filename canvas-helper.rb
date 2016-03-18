module CanvasHelper
	def empty_space(line_diff)
		Array.new(line_diff, " ").join("")
	end

	def turtle_case(name)
		return name[0].downcase + name[1..-1]
	end
	
	def clean(key)
		case key
			when "type" then "theType"
			when "private" then "thePrivate"
			else key
		end
	end
end