class MadLib

	def initialize filename
		@filepath = File.join(APP_ROOT, 'patterns', filename)
		@compiled_content = ""
	end

	def launch!
		print welcome_message

		process! if File.exists? @filepath	
		
	end

	def process!
		copy_file_content

		compile variables

		compile placeholders

		puts @compiled_content
	end

	private
	def welcome_message
		"\n*************** Welcome to Mad Lib ***************\n\n"
	end

	def file_content
		@_file_content ||=  "".tap do |content|
			File.open(@filepath, "r") do |file|
				while (line = file.gets)
					content += line.gsub("\n"," ")
		  		end
			end
		end
	end

	def variables
 		file_content.scan(variable_pattern).flatten  
	end

	def placeholders
 		file_content.scan(placeholder_pattern).flatten   				
	end

	def placeholder_pattern
		/\(\(([^(\)\))]+)\)\)/
	end

	def variable_pattern
		/\(\(([a-zA-Z]+):/
	end

	def get_values_for values
		map = {}
		values.each do |value|
			while map[value].nil? || map[value].empty?
				print "Give me #{value.gsub(/[a-zA-Z]+:/,'')}: "
				map[value] = gets.chomp.strip
			end
		end
		map
	end

	def compile(data)
		@compiled_content = file_content
		compile_with(get_values_for(data))
	end

	def compile_with(mapping)
		mapping.each do |k, v|
			@compiled_content.gsub!("((#{k}))", v)
		end
	end
end