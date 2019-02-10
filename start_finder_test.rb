require 'minitest/autorun'
require_relative 'start_finder'
class StartFinderTest < Minitest::Test
  # UNIT TESTS FOR METHOD execute(graph, find, file)
  # There are no equivalence classes, 
  # this method goes through a sequence of method calls and outputs the longest valid words in an array

  # tests that execute returns the output of longest_words
  def test_execute
  	start = StartFinder.new
  	graph = Minitest::Mock.new
  	find = Minitest::Mock.new
  	file = Minitest::Mock.new
    def graph.char_array(*); 1; end
    def graph.create_array(*); 1; end
    def find.finding_paths(*); 1; end
    def find.finding_paths_while(*);1;end
    def find.node_to_string(*); 1; end
    def find.file_to_arr(*); 1; end
    def find.permutations(*); 1; end
    def find.longest_valid(*); 4; end
    def find.longest_words(*); "CAKE"; end
    assert_equal "CAKE", start.execute(graph, find, file)
  end
end
