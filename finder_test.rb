require 'minitest/autorun'
require_relative 'finder'
class FinderTest < Minitest::Test
  # UNIT TESTS FOR METHOD file_to_arr(f)
  # There are no equivalence classes, 
  # this method returns an array of all the elements in the file

  # this test checks that each line of a file is inputted into an array
  def test_file_to_arr
    find = Finder.new
    file = File.open('test1.txt', 'w+')
    file.write("Hello\nfoo\nbar\ntest")
    file.close
    file = File.open('test1.txt', 'r+')
    assert_equal ["HELLO", "FOO", "BAR","TEST"], find.file_to_arr(file)
  end

  # UNIT TESTS FOR METHOD permutations(arr)
  # There are no equivalence classes, 
  # this method returns an array of permutations of 
  # the words in the array that is passed in that are in the word_list passed in

  # this test accepts an array with three words and returns an array with all the permutations of the valid words in arr
  def test_permutations
    find = Finder.new
    arr = ["CAKE", "ANT", "TRY"]
    word_list = ["CAKE", "NAT"]
    result = find.permutations(arr, word_list)
    expected = ["CAKE", "NAT"]
    assert_equal expected, result
  end

  # UNIT TESTS FOR METHOD longest_valid(file, word_list)
  # Equivalence classes
  # There is no elements in the valid arr -> return 0
  # There is at least one element in the valid arr -> return length of longest word

  # this test accepts one array of strings and returns length 3 for the length of the longest word
  def test_longest_valid_1
    file = ['hi', 'he', 'dog', 'do', 'cat']
    find = Finder.new
    result = find.longest_valid(file)
    arr = ["HI", "HE", "DOG", "CAT"]    
    assert_equal arr, find.valid_arr
    assert_equal 3, result
  end

  # this test accepts one array with a longest valid word of 5
  def test_longest_valid_2
    file = ['kitty','hig', 'hyi', 'dig', 'dok']
    find = Finder.new
    result = find.longest_valid(file)
    arr = ["KITTY"]   
    assert_equal arr, find.valid_arr
    assert_equal 5, result
  end

  # this test accepts an empty array and returns 0 as the length of the longest word
  def test_longest_valid_3
    file = []
    find = Finder.new
    result = find.longest_valid(file)
    arr = []   
    assert_equal arr, find.valid_arr
    assert_equal 0, result
  end

  # UNIT TESTS FOR METHOD longest_words(num)
  # There are no equivalence classes, 
  # this method returns an array of all longest valid words

  # this test accepts integer 8 as the length of the longest valid words and returns all strings from the valid array of length 8
  def test_longest_words_1
    find = Finder.new
    find.valid_arr = ["SUNSHINE", "DOG", "CAT", "JOY", "GREAT", "WEEKENDS"]  
    result = find.longest_words(8)
    expected = ["SUNSHINE", "WEEKENDS"]
    assert_equal expected, result
  end

  # this test accepts integer 5 as the length of the longest valid words and returns the one string from the valid array of length 5
  def test_longest_words_2
    find = Finder.new
    find.valid_arr = ["HAPPY"]  
    result = find.longest_words(5)
    expected = ["HAPPY"]
    assert_equal expected, result
  end

  # UNIT TESTS FOR METHOD node_to_string(arr)

  # Equivalence classes
  # The array is empty -> return empty array
  # The array has arrays of nodes -> return an array of each array's node's character's stitched together into a string

  # this test acceps an array of one array, and converts the one array to a string using the node's character
  def test_node_to_string_1
    find = Finder.new
    node1 = Minitest::Mock.new
    node2 = Minitest::Mock.new
    node3 = Minitest::Mock.new
    def node1.ch; 'C'; end
    def node1.id; '1'; end
    def node2.ch; 'A'; end
    def node2.id; '2'; end
    def node3.ch; 'K'; end
    def node3.id; '3'; end
    arr = [[node1, node2, node3]]
    arr3 = find.node_to_string(arr)
    assert_equal arr3, ['CAK']
  end

  # this test acceps an array of 3 arrays, and converts the arrays to a string using the node's character
  def test_node_to_string_2
    find = Finder.new
    node1 = Minitest::Mock.new
    node2 = Minitest::Mock.new
    node3 = Minitest::Mock.new
    def node1.ch; 'C'; end
    def node1.id; '1'; end
    def node2.ch; 'A'; end
    def node2.id; '2'; end
    def node3.ch; 'K'; end
    def node3.id; '3'; end
    arr = [[node1],[node2], [node3]]
    arr3 = find.node_to_string(arr)
    assert_equal arr3, ['C','A','K']
  end

  # this test accepts an empty array and returns and empty array
  def test_node_to_string_3
    find = Finder.new
    arr = []
    arr3 = find.node_to_string(arr)
    assert_equal arr3, []
  end

  # this test acceps an array of 2 arrays, and converts the arrays to a string using the node's character
  def test_node_to_string_4
    find = Finder.new
    node1 = Minitest::Mock.new
    node2 = Minitest::Mock.new
    node3 = Minitest::Mock.new
    def node1.ch; 'C'; end
    def node1.id; '1'; end
    def node2.ch; 'A'; end
    def node2.id; '2'; end
    def node3.ch; 'K'; end
    def node3.id; '3'; end
    arr = [[node1, node2], [node3]]
    arr3 = find.node_to_string(arr)
    assert_equal arr3, ['CA','K']
  end

  # UNIT TESTS FOR METHOD finding_paths(file_arr)

  # Equivalence classes
  # The array is empty -> return empty array
  # The array has arrays of multiple nodes -> return arrays of length 2 containing each combination of the first node and the other indices
  # The array has arrays of single nodes -> preserve the single nodes

  # this test acceps an array of 2 arrays and returns an array of each combination of the first index and other indices for each subarray
  def test_finding_paths_1
    find = Finder.new
    node1 = Minitest::Mock.new
    node2 = Minitest::Mock.new
    node3 = Minitest::Mock.new
    node4 = Minitest::Mock.new
    def node1.ch; 'C'; end
    def node1.id; '1'; end
    def node2.ch; 'A'; end
    def node2.id; '2'; end
    def node3.ch; 'K'; end
    def node3.id; '3'; end
    def node4.ch; 'E'; end
    def node4.id; '4'; end
    def node1.nil?; false; end
    def node2.nil?; false; end
    def node3.nil?; false; end
    def node4.nil?; false; end
    arr = [[node1, node2, node3], [node3, node4]]
    arr3 = find.finding_paths(arr)
    assert_equal arr3, [[node1, node2], [node1, node3], [node3, node4]]
  end

 # this test acceps an array of 3 arrays with single nodes, and returns an array of the preserved single node arrays 
  def test_finding_paths_2
    find = Finder.new
    node1 = Minitest::Mock.new
    node3 = Minitest::Mock.new
    node4 = Minitest::Mock.new
    def node1.ch; 'C'; end
    def node1.id; '1'; end
    def node3.ch; 'K'; end
    def node3.id; '3'; end
    def node4.ch; 'E'; end
    def node4.id; '4'; end
    def node1.nil?; false; end
    def node3.nil?; false; end
    def node4.nil?; false; end
    arr = [[node1], [node3], [node4]]
    arr3 = find.finding_paths(arr)
    assert_equal arr3, [[node1], [node3], [node4]]
  end

  # this test accepts and array containing arrays of both single and multiple nodes, and returns an array that preserves the single node arrays and arrays of each multiple node array's combination of the first index and other indices
  def test_finding_paths_3
    find = Finder.new
    node1 = Minitest::Mock.new
    node2 = Minitest::Mock.new
    node3 = Minitest::Mock.new
    node4 = Minitest::Mock.new
    def node1.ch; 'C'; end
    def node1.id; '1'; end
    def node2.ch; 'A'; end
    def node2.id; '2'; end
    def node3.ch; 'K'; end
    def node3.id; '3'; end
    def node4.ch; 'E'; end
    def node4.id; '4'; end
    def node1.nil?; false; end
    def node2.nil?; false; end
    def node3.nil?; false; end
    def node4.nil?; false; end
    arr = [[node1, node2, node3], [node3, node4], [node4]]
    arr3 = find.finding_paths(arr)
    assert_equal arr3, [[node1, node2], [node1, node3], [node3, node4], [node4]]
  end

  # this test accepts an empty array and returns and empty array
  def test_finding_paths_4
    find = Finder.new
    arr = []
    arr3 = find.finding_paths(arr)
    assert_equal arr3, []
  end

  # UNIT TESTS FOR METHOD concatonation(arr_con)
  # Equivalence classes:
  # If the first and last index of two different arrays contain the same node -> returns an array that adds the two arrays and remove the repeated node at the merge position
  # If If the first and last index of two different arrays do not contain the same node -> returns and array that preserves the arrays of single nodes

  # this test checks that the two arrays are merged without the repeated node at the merge position
  def test_concatonation_1
    find = Finder.new
    node1 = Minitest::Mock.new
    node2 = Minitest::Mock.new
    node3 = Minitest::Mock.new
    node4 = Minitest::Mock.new
    def node1.ch; 'C'; end
    def node1.id; '1'; end
    def node2.ch; 'A'; end
    def node2.id; '2'; end
    def node3.ch; 'K'; end
    def node3.id; '3'; end
    def node4.ch; 'E'; end
    def node4.id; '4'; end
    arr = [[node1, node2], [node2, node3, node4]]
    arr3 = find.concatonation(arr)
    assert_equal arr3, [[node1, node2, node3, node4]]
  end

  # this test checks that if all arrays preserved since none have a last index matching another's first
  def test_concatonation_2
    find = Finder.new
    node1 = Minitest::Mock.new
    node2 = Minitest::Mock.new
    node3 = Minitest::Mock.new
    node4 = Minitest::Mock.new
    def node1.ch; 'C'; end
    def node1.id; '1'; end
    def node2.ch; 'A'; end
    def node2.id; '2'; end
    def node3.ch; 'K'; end
    def node3.id; '3'; end
    def node4.ch; 'E'; end
    def node4.id; '4'; end
    arr = [[node1], [node2], [node3], [node4]]
    arr3 = find.concatonation(arr)
    assert_equal arr3, [[node1], [node2], [node3], [node4]]
  end

  # this test checks that if the first two arrays are merged without the repeated node at the merge position and the last array is preserved
  def test_concatonation_3
    find = Finder.new
    node1 = Minitest::Mock.new
    node2 = Minitest::Mock.new
    node3 = Minitest::Mock.new
    node4 = Minitest::Mock.new
    def node1.ch; 'C'; end
    def node1.id; '1'; end
    def node2.ch; 'A'; end
    def node2.id; '2'; end
    def node3.ch; 'K'; end
    def node3.id; '3'; end
    def node4.ch; 'E'; end
    def node4.id; '4'; end
    arr = [[node1, node2], [node2, node3], [node4]]
    arr3 = find.concatonation(arr)
    assert_equal arr3, [[node1, node2, node3], [node4]]
  end

  # this test checks that if the middle array is merged without the repeated node at the merge position with both the other arrays
  def test_concatonation_4
    find = Finder.new
    node1 = Minitest::Mock.new
    node2 = Minitest::Mock.new
    node3 = Minitest::Mock.new
    node4 = Minitest::Mock.new
    def node1.ch; 'C'; end
    def node1.id; '1'; end
    def node2.ch; 'A'; end
    def node2.id; '2'; end
    def node3.ch; 'K'; end
    def node3.id; '3'; end
    def node4.ch; 'E'; end
    def node4.id; '4'; end
    arr = [[node1, node2], [node2, node3], [node3, node4]]
    arr3 = find.concatonation(arr)
    assert_equal arr3, [[node1, node2, node3], [node2, node3, node4]]
  end

  # this test checks that the first array is merged with the second, and the second array is preserved
  def test_concatonation_5
    find = Finder.new
    node1 = Minitest::Mock.new
    node2 = Minitest::Mock.new
    node3 = Minitest::Mock.new
    node4 = Minitest::Mock.new
    def node1.ch; 'C'; end
    def node1.id; '1'; end
    def node2.ch; 'A'; end
    def node2.id; '2'; end
    def node3.ch; 'K'; end
    def node3.id; '3'; end
    def node4.ch; 'E'; end
    def node4.id; '4'; end
    arr = [[node1, node2], [node2]]
    arr3 = find.concatonation(arr)
    assert_equal arr3, [[node1, node2], [node2]]
  end

  # this test accepts an empty array and returns and empty array
  def test_concatonation_6
    find = Finder.new
    arr = []
    arr3 = find.concatonation(arr)
    assert_equal arr3, []
  end

  # UNIT TESTS FOR METHOD add_line(char_arr, line, arrayc, arrayi)
  # Equivalence classes:
  # If line array is > length 2 then the children are added to the array
  # If the line array length < 2 there are no children and the array returned = the one passed in

  # this test checks that if the line array shows the node has children then all children are correctly added to the array
  def test_add_line
    find = Finder.new
    char_arr = []
    char_arr.push(Node.new('C', 1))
    line = [1, 'C', 2, 3]
    arrayc = ["C", "A", "K", "T", "E","B"]
    arrayi = ["1","2","3","4","5","6"]
    result_arr = []
    result_arr.push(Node.new('C', 1))
    result_arr.push(Node.new('A', 2))
    result_arr.push(Node.new('K', 3))
    char_arr = find.add_line(char_arr, line, arrayc, arrayi)
    char_arr.each_index do |i|
      assert_equal result_arr[i].id, char_arr[i].id
      assert_equal result_arr[i].ch, char_arr[i].ch
    end
  end

  # this test checks that if the line shows the node does not have children then no elements are added to the array
  def test_add_line_1
    find = Finder.new
    char_arr = []
    char_arr.push(Node.new('C', 1))
    line = [1, 'C']
    arrayc = ["C", "A", "K", "T", "E","B"]
    arrayi = ["1","2","3","4","5","6"]
    assert_equal char_arr, find.add_line(char_arr, line, arrayc, arrayi)
  end
end