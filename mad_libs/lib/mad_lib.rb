class MadLib

	def initialize filename
		@filepath = File.join(APP_ROOT, 'patterns', filename)
		
	end

	def launch!
		print_welcome_message
		unless !File.exists? @filepath
			placeholders.each do |placeholder|
				puts placeholder
			end

		end
	end

	private
	def print_welcome_message
		puts "\n" 
		puts "*************** Welcome to Mad Lib ***************"
		puts "\n\n"
	end

	def placeholders
		unless @placeholders
		@placeholders = []
		File.open(@filepath, "r") do |file|
			while (line = file.gets)
  				@placeholders += line.scan(/\(\(([^(\)\))]+)\)\)/).flatten   				
  			end
			end
		end
		@placeholders
	end
end