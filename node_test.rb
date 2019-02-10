require 'minitest/autorun'
require_relative 'node'
class NodeTest < Minitest::Test
# UNIT TESTS FOR METHOD initialize(character, id)
# This method would not have equivalence classes, 
# Character and id will be set as whatever is passed in

# Sets node.id and node.ch to values pased in
  def test_initialize
	node = Node.new('A', 1)
	assert_equal 'A', node.ch
	assert_equal 1, node.id
  end
end