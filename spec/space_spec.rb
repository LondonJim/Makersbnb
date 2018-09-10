require 'pg'

describe '.all' do
  it 'returns a list of spaces' do
    add_three_spaces
    expect(spaces.all).to eq([])
  end
end
