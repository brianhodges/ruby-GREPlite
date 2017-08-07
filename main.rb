puts
if ARGV.size != 2
	puts 'You must enter both parameters.'
	puts 'Ex. ruby main.rb C:\path\to\directory "pattern match"'
	exit
end

dir = ARGV[0].strip.to_s
search = ARGV[1].strip.to_s
matches = []

Dir.foreach(dir) do |file|
	if file.length > 3
		path = dir + '\\' + file
		text = File.open(path).read
		text.each_line{ |line| matches << path if line.include? search }
	end
end
puts 'Results:'
puts '========'
puts !matches.empty? ? matches.each{|filename| filename } : 'No matches found.'