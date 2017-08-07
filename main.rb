dir = ARGV[0].strip.to_s unless !ARGV[0]
search = ARGV[1].strip.to_s unless !ARGV[1]
matches = []

puts
puts
if dir && search
	Dir.foreach(dir) do |file|
		if file != '.' && file != '..'
			path = dir + '\\' + file
			text = File.open(path).read
			text.each_line do |line|
				if line.to_s.include? search
					matches << path  
				end
			end
		end
	end
	puts 'Results:'
	puts '========'
	if !matches.empty?
		matches.each do |filename|
			puts filename
		end
	else
		puts 'No matches found.'
	end
else
	puts 'You must enter both parameters.'
	puts 'Ex. ruby grep.rb C:\path\to\directory "pattern match"'
end