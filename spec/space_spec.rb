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
# call private #show_availability method within .all
# for now we iterate over this list and show each date under space information
  end
end

describe '#show_availability' do
  it 'it takes one argument' do
    add_one_space
    space = Space.all.first
    expect(space).to respond_to(:show_availability).with(1).argument
  end

  it 'returns a list of dates the space is available' do
    add_one_space
    space = Space.all.first
    expect(space.show_availability(1)).to eq(["10/09/2018", "11/09/2018"])
    # this accesses the avilability table using space_id
    # can use an easier to read variable and access via space table first
  end
end

# add_availability(space_id, date) method

