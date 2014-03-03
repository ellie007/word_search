require 'word_search'

describe Word Search do

  let(:word) { WordSearch.new }

  it 'should find a word' do
    word.character_set('mrw')
  end

end
