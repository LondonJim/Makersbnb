require 'pg'
require 'space'

describe '.all' do
  it 'returns a list of spaces' do
    add_one_space
    space = Space.all.first
    expect(space.id).to eq(1)
    expect(space.name).to eq('spacename1')
    expect(space.owner_id).to eq(1)
    expect(space.information).to eq('Great house')
    expect(space.location).to eq('123 Fake Street')
    expect(space.price).to eq(100)
  end
end
