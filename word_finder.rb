require_relative 'finder'
require_relative 'start_finder'

def check_args(args)
  args.count == 1
rescue StandardError
  false
end

if check_args ARGV
  puts 'Could not access file' if File.exist?(ARGV[0]) == false
  if File.exist?(ARGV[0]) == true
    result = StartFinder.new.execute(Graph.new, Finder.new, ARGV[0])
    puts 'No valid words' if result.empty?
    Finder.new.print_result(result)
  end
else
  puts Finder.new.show_usage_and_exit
end
