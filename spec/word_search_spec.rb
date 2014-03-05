require "solver"

describe Solver do

  let(:grid) { Solver.new("abc\ndef", ["ab", "cf"]) }

  it "should evaluate the grid horizontally" do
    grid.horizontal.should == "ABc\ndef"
  end

  it "should evaluate the grid vertically" do
    grid.vertical.should == "abC\ndeF"
  end

  it "transpose a vertical" do
    grid.find_words_in_row("abc").should == "ABc\n"
  end

  it "should transpose the grid" do
    grid.transpose("abc\ndef").should == "ad\nbe\ncf"
  end

  it "should use the solve method" do
    grid.solve.should == "ABC\n..F"
  end

end
