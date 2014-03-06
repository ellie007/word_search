require "solver"

describe Solver do

  let(:grid) { Solver.new("abc\ndef", ["ab", "cf", "ed"]) }

  it "should evaluate the grid horizontally" do
    grid.horizontal.should == "ABc\ndef"
  end

  it "should evaluate the grid vertically" do
    grid.vertical.should == "abC\ndeF"
  end

  it "should vertically transpose the grid" do
    grid.vertical_transpose("abc\ndef").should == "ad\nbe\ncf"
  end

  it "should evaluate the grid backwards" do
    grid.backward.should == "abc\nDEf"
  end

  it "should backwardly transpose grid" do
    grid.backward_transpose("abc\ndef").should == "cba\nfed"
  end

  it "finds a word in a single row" do
    grid.find_words_in_row("abc").should == "ABc\n"
  end

  it "should solve any problem" do
    grid.solve.should == "ABC\nDEF"
  end

end

