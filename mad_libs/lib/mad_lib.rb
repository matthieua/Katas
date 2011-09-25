class MadLib

	def initialize filename
		@filepath = File.join(APP_ROOT, 'patterns', filename)
		@placeholder_map = {}
		@text = ""
	end

	def launch!
		print welcome_message
		unless !File.exists? @filepath	
			fetch_text

			map_placeholder			
		end
	end

	private
	def welcome_message
		"\n*************** Welcome to Mad Lib ***************\n\n"
	end

	def fetch_text
		File.open(@filepath, "r") do |file|
			while (line = file.gets)
				@text += line			
	  		end
		end
	end

	def placeholders
 		@text.scan(placeholder_pattern).flatten   				
	end

	def placeholder_pattern
		/\(\(([^(\)\))]+)\)\)/
	end

	def map_placeholder
		placeholders.each do |placeholder|
			print "Give me #{placeholder}: "
			@placeholder_map[placeholder] = gets.chomp.strip
		end
		# @placeholder_map = "{\"a verb, past tense\"=>\"sad\", \"a number\"=>\"2\", \"a plural noun\"=>\"dsf\", \"a noun\"=>\"asd\", \"a verb ending in ing\"=>\"sad\", \"an adjective\"=>\"dfds\", \"an adverb\"=>\"ad\", \"a body part\"=>\"sgd\"}"
	end
end