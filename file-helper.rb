module FileHelper
	def file_empty(file_name)
		File.open(file_name, 'w') { |file| file.write("") }
	end

	def file_append(file_name, str)
		File.open(file_name, 'a+') { |file| file.write("\n\n"+str) }
	end

	def file_preppend(file_name, str)
		original = File.open(file_name).read
		new_file = str + original
		File.open(file_name, 'w') { |file| file.write(new_file) }
	end
end
