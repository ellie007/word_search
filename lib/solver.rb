class Solver

  def horiztonal(grid_of_letters, words)
    mutated_grid_of_letters = ""
    index = 0

    grid_of_letters.split("\n").each do |row|
      words.each do |word|
        if row.include?(word)
          upcased_letters = row[row.index(word)..row.index(word)+word.length - 1].upcase!
          row[row.index(word)..row.index(word)+word.length - 1] = upcased_letters
        end
      end
      mutated_grid_of_letters << grid_of_letters.split("\n")[index] = row + "\n"
      index += 1
    end
    mutated_grid_of_letters
  end


  def vertical(grid_of_letters, words)
    mutated_grid_of_letters = ""
    index = 0

    transpose(grid_of_letters).each do |row|
      words.each do |word|
        if row.include?(word)
          upcased_letters = row[row.index(word)..row.index(word)+word.length - 1].upcase!
          row[row.index(word)..row.index(word)+word.length - 1] = upcased_letters
        end
      end
      mutated_grid_of_letters << grid_of_letters.split("\n")[index] = row + "\n"
      index += 1
    end
    transpose(mutated_grid_of_letters).join("\n")
  end


  def transpose(grid_of_letters)
    set_index = 0
    sub_index = 0
    greater_array = []

    while sub_index < grid_of_letters.split("\n").length do
      row = ""
      while set_index < grid_of_letters.split("\n").length do
        row << grid_of_letters.split("\n")[set_index][sub_index]
        greater_array << row
        set_index += 1
      end
      row = ""
      set_index = 0
      sub_index += 1
    end
    greater_array.uniq!
  end


  def solve(grid_of_letters, words)
    mutated_grid_of_letters = ""
    index = 0

    horizontal_eval = horiztonal(grid_of_letters, words)

    vertical(horizontal_eval, words).split("\n").each do |row|
      row.split("").each { |letter| row[letter] = "." if letter != letter.upcase }
      mutated_grid_of_letters << grid_of_letters.split("\n")[index] = row + ("\n")
      index += 1
    end
    mutated_grid_of_letters.downcase
  end


end

print Solver.new.solve("abcde\nfghij\nklmno\npqrst\nuvwxy\n", ["abc", "fgh", "mrw", "nsx", "oty"])

#print Solver.new.transpose_grid("abcde\nfghij\nklmno\npqrst\nuvwxy\n")

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

