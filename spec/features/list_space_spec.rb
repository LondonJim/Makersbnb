Capybara.app = MakersBnB

  # As a user,
  # So I can advertise my space,
  # I want to be able to list my space.

feature 'View spaces' do
  scenario 'user can see all spaces' do
    connection = PG.connect(dbname: 'makers_bnb_test')
    add_three_spaces
    visit('/spaces')
    expect(page).to have_content "spacename1"
    expect(page).to have_content "spacename2"
    expect(page).to have_content "spacename3"
  end

  # As a user,
  # So I can let people know the details of my space,
  # I want to be able to enter details of my space: name, description, price.

  scenario 'user can see details of all spaces' do
    add_three_spaces
    visit('/spaces')
    expect(page).to have_content "price: "
    expect(page).to have_content "location: "
    expect(page).to have_content "rentername: "
  end

  # As a user,
  # So I can let people know when the space is available,
  # I want to be able to list a range of dates of availability.

  scenario 'user can availability of spaces' do
    add_three_spaces
    visit('/spaces')
    expect(page).to have_content "10/09/2018, 11/09/2018"
  end

end
