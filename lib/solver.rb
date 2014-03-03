class Solver

  def solve(grid_of_letters, words)
    sorted_words = words.sort_by! { |word| word.length }
    sorted_words = sorted_words.sort! { |a, b| b <=> a }

    mutated_grid_of_letters = ""
    index = 0

    grid_of_letters.split("\n").each do |row|
      sorted_words.each do |word|
        if row.include?(word)
          upcased_letters = row[row.rindex(word)..row.rindex(word)+word.length - 1].upcase!
          row[row.rindex(word)..row.rindex(word)+word.length - 1] = upcased_letters
        end
      end
      row.split("").each { |letter| row[letter] = "." if letter != letter.upcase }
      mutated_grid_of_letters << grid_of_letters.split("\n")[index] = row + ("\n")
      index += 1
    end
    mutated_grid_of_letters.downcase!
  end

end

#puts solve("abcde\nfghij\nklmno\npqrst\nuvwxy\n", "abc")

puts Solver.new.solve("abcde\nfghij\nklmno\npqrst\nuvwxy\n", ["abc", "fgh", "klm", "pqr", "uvw"])

#puts solve('abbcde', 'bcd') # == '..bcd.'

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


