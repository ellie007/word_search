class Solver

  def initialize(grid_of_letters, words)
    @current_state = grid_of_letters
    @words = words
  end


  def horizontal
    @current_state = @current_state.split("\n").each do |row|
      find_words_in_row(row)
    end.join("\n")
  end


  def vertical
    @current_state = transpose(@current_state).split("\n").each do |row|
      find_words_in_row(row)
    end.join("\n")
    @current_state = transpose(@current_state)
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


  def transpose(grid)
    split_grid = grid.split("\n").map { |row| row.split("") }
    split_grid.transpose.map(&:join).join("\n")
  end


  def solve
    vertical
    horizontal

    @current_state = @current_state.split("\n").each do |row|
      row.split("").each { |letter| row[letter] = "." if letter != letter.upcase }
    end.join("\n")
  end

end

#print Solver.new("abcde\nfghij\nklmno\npqrst\nuvwxy\n", ["abc", "oty"]).solve

#puts Solver.new.transpose("abcde\nfghij\nklmno\npqrst\nuvwxy\n")

#print Solver.new.vertical("abcde\nfghij\nklmno\npqrst\nuvwxy\n", ["mrw", "nsx", "oty"])


