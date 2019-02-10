require_relative 'node'
# Graph Class - Creates 2D array representing the acyclic graph
class Graph
  attr_accessor :arrayc, :arrayi
  def initialize
    @arrayc = []
    @arrayi = []
  end

  def char_array(file)
    arrc = []
    arri = []
    File.readlines(file).each do |line|
      line = line.split(';')
      arrc.push(line[1])
      arri.push(line[0])
    end
    @arrayc = arrc
    @arrayi = arri
  end

  def create_array(file, find)
    array_final = []
    File.readlines(file).each do |line|
      line = line.split(/[,;\n]/)
      node = Node.new(line[1], line[0])
      char_arr = []
      char_arr.push(node)
      char_arr = find.add_line(char_arr, line, @arrayc, @arrayi)
      array_final.push(char_arr)
    end
    array_final
  end
end
