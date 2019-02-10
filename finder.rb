require_relative 'graph'
# class finder
class Finder
  attr_accessor :flag, :valid_arr

  def initialize
    @flag = true
    @valid_arr = []
  end

  def show_usage_and_exit
    puts 'Usage:'
    puts 'ruby word_finder.rb *graph_file*'
    exit 1
  end

  def print_result(arr)
    arr.each do |i|
      puts i
    end
  end

  def file_to_arr(file)
    word_list = []
    file.each_line do |line|
      line = line.split("\n")
      line = line[0].upcase
      word_list.push(line)
    end
    word_list
  end

  def finding_paths(file_arr)
    arr = []
    (0..file_arr.length - 1).each do |i|
      str = []
      file_arr[i].each_index do |j|
        str.push((file_arr[i])[j]) if j.zero?
        if j.zero? && (file_arr[i])[j + 1].nil? == true
          arr.push(str)
        elsif j != 0
          temp = str.clone
          temp.push(file_arr[i][j])
          arr.push(temp)
        end
      end
    end
    arr
  end

  def finding_paths_while(arr1)
    while @flag == true
      arr1 = concatonation(arr1)
      puts ''
    end
    arr1
  end

  def node_to_string(arr)
    arr2 = []
    (0..arr.length - 1).each do |k|
      str = ''
      arr1 = arr[k]
      (0..arr1.length - 1).each do |w|
        str += arr1[w].ch
      end
      arr2.push(str)
    end
    arr2
  end

  def concatonation(arr_con)
    @flag = false
    arr1 = []
    (0..arr_con.length - 1).each do |k|
      str1 = arr_con[k]
      (0..arr_con.length - 1).each do |w|
        str2 = arr_con[w]
        if str1[str1.length - 1].id == str2[0].id && (str1.length == 1 || str2.length == 1)
          if str1.length == 1
            arr1.push(str2.clone)
          else
            arr1.push(str1.clone)
          end
        elsif str1[str1.length - 1].id == str2[0].id
          strone = str1.clone
          strtwo = str2.clone
          strone.pop
          strone.concat(strtwo)
          arr1.push(strone)
          @flag = true
        end
      end
    end
    arr1
  end

  def permutations(arr, word_list)
    valid = []
    h2 = word_list.each_with_object(Hash.new { |h, k| h[k] = [] }) do |w, h1|
      y = w.each_char.sort.join
      h1[y] << w
    end
    arr.each do |w|
      key = w.chars.sort.join
      if h2.key?(key)
        h2[key].each do |i|
          valid.push(i)
        end
      end
    end
    valid
  end

  def longest_valid(file)
    longest = ''
    file.each_index do |word|
      if file[word].length >= longest.length
        longest = file[word]
        @valid_arr.push(file[word].upcase)
      end
    end
    longest.length
  end

  def longest_words(num)
    arr_longest = []
    @valid_arr.each_index do |word|
      bool2 = @valid_arr[word].length == num
      bool3 = arr_longest.include?(@valid_arr[word]) == false
      arr_longest.push(@valid_arr[word]) if bool2 && bool3
    end
    arr_longest
  end

  def add_line(char_arr, line, arrayc, arrayi)
    line_loop = 2
    until line[line_loop].nil?
      ch = arrayc[arrayi.find_index(line[line_loop].to_s).to_i]
      id = line[line_loop]
      node = Node.new(ch, id)
      char_arr.push(node)
      line_loop += 1
    end
    char_arr
  end
end
