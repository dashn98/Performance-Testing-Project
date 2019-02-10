require_relative 'graph'
require_relative 'finder'
# Start Finder to contain execute method
class StartFinder
  def execute(graph, find, file)
    graph.char_array(file)
    file_arr = graph.create_array(file, find)
    paths = find.finding_paths(file_arr)
    paths_arr = find.finding_paths_while(paths)
    path_str = find.node_to_string(paths_arr)
    f = File.open('wordlist.txt', 'r+')
    word_list = find.file_to_arr(f)
    permutations = find.permutations(path_str, word_list)
    word = find.longest_valid(permutations)
    final_list = find.longest_words(word)
    final_list
  end
end
