class Solver

  def initialize(grid_of_letters, words)
    @solution = ''
    @grid_of_letters = grid_of_letters
    @words = words
  end


  def horizontal
    index = 0
    @solution = @grid_of_letters.split("\n").each do |row|
      find_words_in_row(row)
      index += 1
    end.join("\n")
  end


  def vertical
    index = 0
    @solution = transpose.split("\n").each do |row|
      find_words_in_row(row)
      index += 1
    end.join("\n")
  end


  def find_words_in_row(row)
    @words.each do |word|
      start_index = row.index(word)
      if start_index
        upcased_letters = row[start_index..start_index + word.length - 1].upcase!
        row[start_index..start_index + word.length - 1] = upcased_letters
      end
    end
    row + "\n"
  end


  def transpose
    split_grid = @solution.split("\n").map { |row| row.split("") }
    split_grid.transpose.map(&:join).join("\n")
  end


  def solve
    horizontal
    vertical

    @solution = @solution.split("\n").each do |row|
      row.split("").each { |letter| row[letter] = "." if letter != letter.upcase }
      #@grid_of_letters.split("\n")[index] = row + ("\n")
    end
    @solution.join("\n")
  end


end

print Solver.new("abcde\nfghij\nklmno\npqrst\nuvwxy\n", ["abc", "oty"]).solve

#puts Solver.new.transpose("abcde\nfghij\nklmno\npqrst\nuvwxy\n")

#print Solver.new.vertical("abcde\nfghij\nklmno\npqrst\nuvwxy\n", ["mrw", "nsx", "oty"])



# def remove_unused_letters(row, word)
#  index = 0
#   row.split('').each do |row_letter|
#     if word.include?(row_letter) && row[index..index + word.length-1] == word
#       index += word.length
#     else
#       row[index] = "."
#       index += 1
#     end
#   end
#   row
# end

# THIS IS THE HASH TRIAL!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
# def hash


# word = "DOGGHTCAT"
# word_hash = [6, 7, 8, 0, 1, 2]

# word_hash.each do |value|
#   word_hash.include?

#   indices.each do |index|
# end

# puts hash

