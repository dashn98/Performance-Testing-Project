require 'minitest/autorun'
require_relative 'graph'
require_relative 'node'
class GraphTest < Minitest::Test
  # UNIT TESTS FOR METHOD char_array(file)
  # Equivalence classes:
  # The file has no lines -> arrayc and arrayi remain an empty array
  # The file has lines -> arrayc and arrayi are set to arrays where arrayi is all the first elements in each line of the file and arrayi is an array of the second element on each line

  # This test checks that arrayc and arrayi are set correctly given the proper file is inputted
  def test_char_array
	file = File.open('test1.txt', 'w+')
	file.write("1;C;2,3\n2;A;3,4,6\n3;K;5\n4;T;\n5;E;\n6;B;")
	file.close
	file = File.open('test1.txt', 'r+')
	graph = Graph.new
	graph.char_array(file)
	assert_equal ["1","2","3","4","5","6"], graph.arrayi
	assert_equal ["C", "A", "K", "T", "E","B"], graph.arrayc
  end

  # this test checks that arrayc and arrayi remain empty if the file has no lines
  def test_char_array_1
	file = File.open('test2.txt', 'w+')
	file.close
	file = File.open('test2.txt', 'r+')
	graph = Graph.new
	graph.char_array(file)
	assert_equal [], graph.arrayi
	assert_equal [], graph.arrayc
  end

  # UNIT TESTS FOR METHOD create_array(f, find)
  # The file has no lines -> an empty array is returned
  # The file has lines -> an array with all the line arrays is returned

  # tests that create_array returns an array that contains all the line arrays from the file
  def test_create_array
	f = File.open('test2.txt', 'w+')
	f.write("1;C;2,3\n2;A;3,4,6\n3;K;5\n4;T;\n5;E;\n6;B;")
	f.close
	file = File.open('test2.txt', 'r+')
	graph = Graph.new
	find = Minitest::Mock.new
	def find.add_line(*); 1; end
	arr = graph.create_array(f, find)
	assert_equal [1, 1, 1, 1, 1, 1], arr
  end

  # tests that create_array returns an empty array when an empty file is entered
  def test_create_array_1
	f = File.open('test3.txt', 'w+')
	f.close
	file = File.open('test2.txt', 'r+')
	graph = Graph.new
	find = Minitest::Mock.new
	def find.add_line(*); nil; end
	arr = graph.create_array(f, find)
	assert_equal [], arr
  end
end
