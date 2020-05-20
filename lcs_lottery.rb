require 'csv'

raise ArgumentError, 'Please provide a path to an input file and winning number' if ARGV.size < 2
file_path, winning_number = ARGV
raise ArgumentError, 'Input file does not exist' unless File.exist?(file_path)
store = Hash.new(0)

def lcs(str1, str2)
  matrix = Array.new(str1.length + 1) {Array.new(str2.length + 1, '')}

  str1.each_char.with_index do |char1, i|
    str2.each_char.with_index do |char2, j|
      matrix[i+1][j+1] = if char1 == char2
        matrix[i][j] + char1
      else
        [matrix[i][j+1], matrix[i+1][j]].max_by(&:length)
      end
    end
  end

  matrix[-1][-1]
end

CSV.foreach(file_path) do |row|
  store[row[0..-2]] += lcs(winning_number, row[-1]).length
end

store.each_pair do |user_info, winning_amount|
  puts [user_info, winning_amount].join(',') if winning_amount > 0
end
